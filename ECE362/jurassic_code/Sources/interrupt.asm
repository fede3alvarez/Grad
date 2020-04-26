; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF RTI_ISR, IRQ_ISR

            XREF __SEG_END_SSTACK, RTI_Cnter, port_u, Scan_Count, Scan_KeyRow, key_val, KEY_TAB, port_p, Step_Idx, STEP_TAB, pot_value, read_pot, JEEP_MODE, pot_shift, old_pot, port_t, DC_cnter, t_on, FAST_SET



;--------------------------------------
;          SUB-ROUTINES
;--------------------------------------

;--------------------------------------
;           INTERRUPTS
;--------------------------------------
; STEPPER_MOTOR
; Runs every second unless in EMERGENCY mode
;
; JEEP_MODE Lasts for 15 sec
; During JEEP Mode, only the DC Motor works
; Every 4 ms the DC Motor is called (total 20 ms)
;
; MENU_MODE
; Normal / Default Operation
; Keyboard is checked every 20 ms
; Potentiometer is checked every 20 ms
;


RTI_ISR:    LDD     RTI_Cnter           ; Load counter to Idx X
            INC                         ; Increment Counter
            STD     RTI_Cnter           ; Store Counter
            LDX     $14                 ;
            IDIV                        ; If 20 ms increment, 
            CPD     $00                 ;   go to FAST_LP
            ORAB    FAST_SET            ;
            BEQ     FAST_LP             ;

END_RTI:    BCLR    CRGFLG, #$80        ;
            RTI

;   FAST_SET:   0000 0000   - Nothing
;               0001 0001   - Read  Key - Round 1
;               0000 0011   - Wait Read to Write
;               0010 0001   - Write Key - Round 1
;               0000 0101   - Wait Write to Read            
;               0100 0001   - Potentiometer
;               1000 0001   - Stepper Motor


FAST_LP:    LDAA    FAST_SET                ;
            BRCLR   $F0,FAST_SET, FAST_END  ;
            
FAST_END:   RTS


RTI_ISR:    LDD     RTI_Cnter           ; Load counter to Idx X
            INC                         ; Increment Counter
            STD     RTI_Cnter           ; Store Counter
            CPD     #1000               ; Has the counter reached value?
            BEQ     END_RTI             ; If not, exit RTI
            MOVW    #0, RTI_Cnter       ; Else, Initialize counter to 0
            
END_RTI:    BCLR    CRGFLG, #$80        ;
            RTI
            
IRQ_ISR:    LDX     RTI_Cnter           ; Load counter to Idx X
            INX                         ; Increment Counter
            STX     RTI_Cnter           ; Store Counter
            CPX     #1000               ; Has the counter reached value?
            BNE     END_RTI             ; If not, exit RTI
            MOVW    #0, RTI_Cnter       ; Else, Initialize counter to 0
            
END_IRQ:    BCLR    CRGFLG, #$80        ;
            RTI

;--------------------------------------
;    KEYBOARD IMPLEMENTATION
;--------------------------------------
;
; 1 ms delay for debouncing is needed
Set_seq:    LDX     Scan_Count          ; Load Scan_Count 
            LDAA    Scan_KeyRow, X      ; Load keyboard sequence
            STAA    port_u              ; Write to Keyboard (Read
            INX                         ;   in next interrupts)
Exit_set:   STX     Scan_Count          ; Store Scan_Count
            RTS

Scan_seq:   BRCLR   port_u, $0F,Key_Read; If Key is pressed, go to Key_Read
            LDX     Scan_Count          ; Check if scna maxed out
            CPX     $04                 ; If so, set Scan_end to $00
            BLO     Scan_end            ;   and FAST_SET to read pot 
            MOVW    #$00, Scan_Count    ;
            MOVB    #$41, FAST_SET      ;
Scan_end:   RTS

Key_Read:   MOVB    #$00, key_val       ; Set key_val to 0, & use as index
Key_Lp:     LDX     key_val             ;
            LDAA    KEY_TAB, x          ; Load key value and    
            CMPA    port_u              ;    compare to port_u 
            BEQ     Exit_key            ; If match move to exit (key_val is set)
            INC     key_val             ; If no match, increase
            BRCLR   key_val,#$10,Key_Lp ;    key_val and try again
            MOVB    #$FF, key_val       ; If no match, key_val=$FF
Exit_key:   RTS

;--------------------------------------
;        STEPPER MOTOR 
;--------------------------------------
; 15 ms Delay between each step
CW_Step:    LDAB    Step_Idx            ; If Step_Idx >= $04
            CMPB    $04                 ;    then set to zero
            BLO     CW_Lp               ; Otherwise, skip
            MOVB    #$00, Step_Idx      ; 
CW_Lp:      LDX     Step_Idx            ;
            LDAA    STEP_TAB, x         ; Read Sequence and write 
            STAA    port_p              ;    it to Stepper Motor
            INC     Step_Idx            ; Update Index for next time
            RTS

CCW_Step:   LDAB    Step_Idx            ; If Step_Idx >= $04
            CMPB    $00                 ;    then set to zero
            BLO     CW_Lp               ; Otherwise, skip
            MOVB    #$04, Step_Idx      ; 
CCW_Lp:     LDX     Step_Idx
            LDAA    STEP_TAB, x         ; Read Sequence and write 
            STAA    port_p              ;    it to Stepper Motor
            DEC     Step_Idx            ; Update Index for next time
            RTS

;--------------------------------------
;        DC MOTOR 
;--------------------------------------
DC_Motor:   LDAA    DC_cnter
            BEQ     DC_Setup            ; If first PWM loop, go to setup
            CMPA    t_on                ; Otherwise, check if all PWN High
            BLO     PWM_ON              ;   are completed
            BRA     PWM_OFF             ;

DC_Setup:   BRA     Pot_SEL             ; Update pot_value
            LDAA    pot_value           ;   pot_value [0;255]  
            LDAB    $0F                 ;   time_on   [0;15]
            MUL                         ; then:
            LDX     #$FF                ;   t_on = pot_value * 15 / 255
            IDIV                        ;   t_on = pot_value * $0F / $FF
            XGDX                        ; Switch ACC. X & D
            STAB    t_on                ; Save t_on (now on Acc B)
            CMPB    $00                 ; If t_on is zero
            BEQ     PWM_OFF              ;  go to PWM_OFF

PWM_ON:     LDAA    DC_cnter            ; Load t_on DC_cnter
            CMPA    t_on                ;   if bigger than t_pn
            BHS     PWM_OFF             ;   branch to PWM_Off
            BSET    port_t,#$80         ; Set Bit 3 of port_t (HIGH)
            INC     DC_cnter            ; Increase Counter
            RTS

PWM_OFF:    LDAA    DC_cnter            ;
            CMPA    $0F                 ;
            BHS     PWN_CLR             ;
            BCLR    port_t,#$80         ; Set Bit 3 of port_t
            INC     DC_cnter            ; Increase Counter
            RTS

PWN_CLR:    MOVB    #$00, DC_cnter      ;
            RTS

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
Pot_SEL:    MOVW    pot_value, old_pot  ; Save previous pot value
            JSR     read_pot            ; And update pot_value
            LDAA    JEEP_MODE           ; If Menu, go to subroutines
            BEQ     Pot_MENU            ; If JEEP mode, exit since
            RTS                         ;  pot_value is already updated                                        

Pot_MENU:   LDAA    pot_value           ; Compare pot_value and 
            SUBA    old_pot             ;    last pot_value
            BHI     Pot_RIGHT           ; If increase, shift right
            BLO     Pot_LEFT            ; If decrease, shift left 
            MOVB    $00, pot_shift      ; If equal, no shift
            MOVB    #$00, FAST_SET      ; Set FAST_LP to completed
            RTS

Pot_RIGHT:  MOVB    $02, pot_shift      ; 
            MOVB    #$00, FAST_SET      ; Set FAST_LP to completed
            RTS

Pot_LEFT:   MOVB    $04, pot_shift      ;
            MOVB    #$00, FAST_SET      ; Set FAST_LP to completed
            RTS

;--------------------------------------
;         Speaker 
;--------------------------------------

;       LAB 6 - 2

