; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF RTI_ISR, IRQ_ISR

            XREF __SEG_END_SSTACK, RTI_Cnter, port_u, Scan_Count, Scan_KeyRow, key_val, KEY_TAB, port_p, Step_Idx, STEP_TAB, pot_value, read_pot, JEEP_MODE, pot_shift, old_pot, port_t, DC_cnter, t_on, FAST_SET, Stepper_ON, JEEP_Cnter, LED_VAL, port_s, EMERG_MODE, EMRG_Cnter, fail_disp, emergency_disp



;--------------------------------------
;          SUB-ROUTINES
;--------------------------------------

;--------------------------------------
;           INTERRUPTS
;--------------------------------------
; STEPPER_MOTOR
; Runs every second unless in EMERGENCY mode
;
; JEEP_MODE Lasts for 30 sec
; During JEEP Mode, only the DC Motor works
; Every 4 ms the DC Motor is called (total 20 ms)
;
; MENU_MODE
; Normal / Default Operation
; Keyboard is checked every 15 ms
; Potentiometer is checked every 20 ms
;


RTI_ISR:    LDAA    JEEP_MODE               ; Check if we are in Jeep Mode
            LBNE    JEEP_LOGIC              ;
            MOVB    #$00, JEEP_Cnter        ;  
            ;                               ;
            LDAA    EMERG_MODE              ; Check if we are in Jeep Mode
            LBNE    EMRG_LOGIC              ;
            MOVB    #$00, EMRG_Cnter        ;  
            ;                               ;
            LDD     RTI_Cnter               ; Load counter to Idx X
            LDX     #$03E0                  ; If 1 sec increment
            IDIV
            CPX     #$00
            BNE     Skip_Step               ;   Set Stepper_ON 
            MOVB    #$00, Step_Idx          ;   and go to Chck_FAST
                                            ;
Skip_Step:  LDX     $14                     ; RTI_Cnter still on Acc. D
            IDIV                            ;
            BNE     Chck_FAST               ; If 20 ms increment,  
            MOVB    #$0F, FAST_SET          ;   Set FAST_SET to Write Keyboard 
Chck_FAST:  BRSET   FAST_SET, $01, FAST_LP  ; If FAST_SET is non-zero

END_RTI:    MOVB    LED_VAL, port_s
            INC     RTI_Cnter               ; If done, Increase
            BCLR    CRGFLG, #$80            ;    RTI_Cnter & Wrap-up
            RTI

;-------------------------------------------;
;           JEEP MODE  LOGIC   
;-------------------------------------------;
JEEP_LOGIC: INC     JEEP_Cnter              ; Check if Jeep Mode time is up,
            LDD     JEEP_Cnter              ;
            CPD     #$7530                  ;   if so, reset all paremeters
            LBNE    DC_Motor                ; Otherwise, branch
            MOVB    $00, JEEP_MODE          ;
            MOVW    $00, JEEP_Cnter         ;
            MOVW    $00, RTI_Cnter          ;
            LBRA    END_RTI                 ;

;-------------------------------------------;
;          EMERGENCY MODE  LOGIC   
;-------------------------------------------;
EMRG_LOGIC: INC     EMRG_Cnter              ;
            LDD     EMRG_Cnter              ;
            CPD     #$7530                  ;   if so, reset all paremeters
            LBEQ    EMRG_FAIL               ;
            LDX     #$03E0                  ; 
            IDIV
            CPX     #$00
            LBEQ    MORE_EMERG              ; Otherwise, branch
            LBRA    END_RTI                 ;
EMRG_FAIL:  JSR     fail_disp               ;
            LBRA    END_RTI

MORE_EMERG: LDAA    LED_VAL                 ; Flip LED LIght every second
            EORA    #$FF                    ;
            CMPA    #$00                    ; If LED=0, write to keyboard
            LBEQ    Set_seq                 ;  Otherwise, scan keyboard
            LBRA    Scan_seq                ;

;-------------------------------------------;
;           FAST_SET & RTI LOGIC   
;-------------------------------------------;
;
;           0000 1111   - Write
;           0000 1011   - Post Write Wait
;           0000 0111   - Read
;           0000 0101   - Potentiometer          
;           0000 0000   - Nothing
;
; 1st Cycle on FAST_LP is used to determine where 
; the stepper motor needs to run 
; (Stepper_ON = True && Step_Idx < $04).
;-------------------------------------------;

FAST_LP:    LDAA    Stepper_ON              ; If Stepper_ON if FALSE ($00)
            BEQ     FAST_KEY                ;   Check Keyboard
            LDAA    Step_Idx                ; If Step_Idx >= $04
            CMPA    #$04                    ;    then set to zero
            LBLO    CW_Lp                   ;    and clear Stepper_ON
            MOVB    #$00,Stepper_ON         ; If here Step_Idx is zero
            LBRA    FAST_END                ; & Stepper Motor is completed        

FAST_KEY:   LDAA    FAST_SET                ; Check FAST_SET &
            CMPA    #$0F                    ;       If == 0000 1111
            LBEQ    Set_seq                 ; Branch to Write Keyboard
            CMPA    #$07                    ;       If == 0000 0111
            LBEQ    Scan_seq                ; Branch to Read Keyboard
            CMPA    #$05                    ;       If == 0000 0101
            LBEQ    Pot_MENU                ; Branch to Potentiometer
            MOVB    #$0B,FAST_SET           ; If neither of the above
                                            ;    This a wait to read Keyboard
FAST_END:   LBRA    END_RTI

            
IRQ_ISR:    LDX     RTI_Cnter               ; Load counter to Idx X
            INX                             ; Increment Counter
            STX     RTI_Cnter               ; Store Counter
            CPX     #1000                   ; Has the counter reached value?
            LBNE    END_RTI                 ; If not, exit RTI
            MOVW    #$0, RTI_Cnter          ; Else, Initialize counter to 0
            
END_IRQ:    MOVB    $FF, EMERG_MODE         ; 
            MOVB    #$FF, LED_VAL           ; Set emergency mode
            JSR     emergency_disp          ; Display emergency message
            RTI

;--------------------------------------
;    KEYBOARD IMPLEMENTATION
;--------------------------------------
;   
; 1 ms delay for debouncing is needed
Set_seq:    LDX     Scan_Count              ; Load Scan_Count 
            LDAA    Scan_KeyRow, X          ; Load keyboard sequence
            STAA    port_u                  ; Write to Keyboard (Read
            INX                             ;   in next interrupts)
            STX     Scan_Count              ; Store Scan_Count
            MOVB    #$0B, FAST_SET          ; Set FAST_SET to Post Write Wait
            LBRA    END_RTI

Scan_seq:   BRCLR   port_u, $0F, Key_Read   ; If Key is pressed, go to Key_Read
            LDX     Scan_Count              ; Check if scan maxed out
            CPX     $04                     ; If so, set Scan_end to $00
            BLO     Scan_end                ;   and FAST_SET to read pot 
            MOVW    #$00, Scan_Count        ;
            MOVB    #$05, FAST_SET          ;
            LBRA    END_RTI                 ;

Scan_end:   MOVB    #$0F, FAST_SET          ; Oherwise, more rows to scan
            LBRA    END_RTI                 ;   set FAST_SET to Write 

Key_Read:   MOVB    #$00, key_val           ; Set key_val to 0, & use as index
Key_Lp:     LDX     key_val                 ;
            LDAA    KEY_TAB, x              ; Load key value and    
            CMPA    port_u                  ;    compare to port_u 
            LBEQ    END_RTI                 ; If match move to exit (key_val is set)
            INC     key_val                 ; If no match, increase
            BRCLR   key_val, #$10, Key_Lp   ;    key_val and try again
            MOVB    #$FF, key_val           ; If no match, key_val=$FF
            LBRA    END_RTI

;--------------------------------------
;        STEPPER MOTOR 
;--------------------------------------
; LAB TIMING
; 15 ms Delay between each step (FAST)
; 60 ms Delay between each step (SLOW)
;
; IMPLEMENTATION TIMING
; 20 ms Delay between each step
; Called every sec on MENU_MODE
;------------------------------------------
; Management of Step_Idx is done on the RTI
; and FAST_LP levels.
; If RTI triggers the Stepper Motor / watch
;   then Step_Idx is reset to 0
; If fast loop is executed, it checks if 
;   4 > Step_Idx and if True, calls CW_Lp
;------------------------------------------

CW_Lp:      LDX     Step_Idx                ;
            LDAA    STEP_TAB, x             ; Read Sequence and write 
            STAA    port_p                  ;    it to Stepper Motor
            INC     Step_Idx                ; Update Index for next time
            MOVB    #$0F,FAST_SET          ; Set FAST_SET to Write Keyboard
            MOVB    #$FF,Stepper_ON        ; Set Stepper_ON, to not check
            LBRA    END_RTI                 ; Stepper Motor until next FAST RTI

;--------------------------------------
;        DC MOTOR 
;--------------------------------------
DC_Motor:   LDAA    DC_cnter                ;
            LBEQ    DC_Setup                ; If first PWM loop, go to setup
            CMPA    t_on                    ; Otherwise, check if all PWN High
            LBLO    PWM_ON                  ;   are completed
            LBRA    PWM_OFF                 ;

DC_Setup:   LBRA    Pot_SEL                 ; Update pot_value
            LDAA    pot_value               ;   pot_value [0;255]  
            LDAB    $0F                     ;   time_on   [0;15]
            MUL                             ; then:
            LDX     #$FF                    ;   t_on = pot_value * 15 / 255
            IDIV                            ;   t_on = pot_value * $0F / $FF
            XGDX                            ; Switch ACC. X & D
            STAB    t_on                    ; Save t_on (now on Acc B)
            CMPB    $00                     ; If t_on is zero
            LBEQ    PWM_OFF                 ;  go to PWM_OFF

PWM_ON:     LDAA    DC_cnter                ; Load t_on DC_cnter
            CMPA    t_on                    ;   if bigger than t_pn
            BHS     PWM_OFF                 ;   branch to PWM_Off
            BSET    port_t,#$80             ; Set Bit 3 of port_t (HIGH)
            INC     DC_cnter                ; Increase Counter
            LBRA    END_RTI

PWM_OFF:    LDAA    DC_cnter                ;
            CMPA    $0F                     ;
            BHS     PWN_CLR                 ;
            BCLR    port_t,#$80             ; Set Bit 3 of port_t
            INC     DC_cnter                ; Increase Counter
            LBRA    END_RTI

PWN_CLR:    MOVB    #$00, DC_cnter          ;
            LBRA    END_RTI

;--------------------------------------
;        LCD 
;--------------------------------------
; LCD is updated by loading the desired
; display in Acc. D, and then calling
; the subroutine display_string
; No need to add LCD to Interrupt Logic
;--------------------------------------


;--------------------------------------
;        Potentiometer 
;--------------------------------------
; Pot is read by calling the subroutine 
; read-pot which will automatically
; update pot_value
;--------------------------------------
Pot_SEL:    MOVW    pot_value, old_pot      ; Save previous pot value
            JSR     read_pot                ; And update pot_value
            LDAA    JEEP_MODE               ; If Menu, go to subroutines
            BEQ     Pot_MENU                ; If JEEP mode, exit since
            BRA     Pot_END                 ;

Pot_MENU:   LDAA    pot_value               ; Compare pot_value and 
            SUBA    old_pot                 ;    last pot_value
            BHI     Pot_RIGHT               ; If increase, shift right
            BLO     Pot_LEFT                ; If decrease, shift left 
            MOVB    $00, pot_shift          ; If equal, no shift
            BRA     Pot_END


Pot_RIGHT:  MOVB    $02, pot_shift          ; 
            BRA     Pot_END

Pot_LEFT:   MOVB    $04, pot_shift          ;
            
Pot_END:    MOVB    #$00, FAST_SET          ; Set FAST_LP to completed
            MOVB    #$FF, Stepper_ON        ; Set Stepper_ON to FALSE 
            LBRA    END_RTI                 ;   to check Stepper on 
                                            ;   next FAST RTI

;--------------------------------------
;         Speaker 
;--------------------------------------

;       LAB 6 - 2

