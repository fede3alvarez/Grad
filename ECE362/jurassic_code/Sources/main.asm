; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry, RTI_ISR, IRQ_ISR 
            XREF __SEG_END_SSTACK,      

; variable/data section
MY_EXTENDED_RAM:    SECTION
                ORG   $800
;-------------ISR Parameters---------------;
Counter:        ds.w    1

;---Stepper Motor Parameters / port_p------;
STEP_TAB:       dc.b    $0A, $12, $14, $0C
Step_Idx:       ds.b    1

;--------Keyboard Parameters / port_u------;
; Table with key value
KEY_TAB:        dc.b    $eb, $77, $7b, $7d, $b7, $bb, $bd, $d7, $db, $dd, $e7, $ed, $7e, $be, $de, $ee
Scan_KeyRow:    dc.b    $70, $B0, $D0, $E0    ; Scan Sequence for Keyboard
Scan_Count:     ds.w    1                     ; Index when Scanning Keyboard
key_press:      ds.b    1                     ; Indicator that a key has been recently pressed
key_val:        ds.b    1                     ; Key Value


MY_CONSTANT_ROM: SECTION
;--------Port settings------------;
; Keyboard Parameters / port_u
port_u:         equ     $268                  
ddr_u:          equ     $26A                   
psr_u:          equ     $26D
peru_u:         equ     $26C
;
; Stepper Motor / port_p
port_p:         equ     $258
ddr_p:          equ     $25A

; Code section
MyCode:             SECTION
Entry:
            LDS     #__SEG_END_SSTACK       ; Initialize stack
            
            ;-----Stepper Moto Setup--------;
            MOVB    #$3E, ddr_p             ; port p / Stepper motor setup
            MOVB    #$00, Step_Idx          ; Stepper motor Sequence Index

            ;-------Keyboard Setup----------;
            BSET    ddr_u, #$F0             ; port u (keyboard) / DDR, set as input
            BSET    peru_u, #$0F            ; port u (keyboard) / PER, Set as pull-up/down
            BSET    psr_u, #$F0             ; port u (keyboard) / PDR, set as pull-up
            MOVW    #$00, Scan_Count        ; initialize the counter
            
            ;-------Interrupts Setup--------;
            MOVB    #$80, CRGINT            ; Enable RTI
            MOVB    #$40, RTICTL            ; Set RTI to 1 ms
            CLI                             ; Initialize Interrupts
        

;--------------------------------
;           INTERRUPTS
;--------------------------------

RTI_ISR:    LDX     Counter             ; Load counter to Idx X
            INX                         ; Increment Counter
            STX     Counter             ; Store Counter
            CPX     #1000               ; Has the counter reached value?
            BNE     END_RTI             ; If not, exit RTI
            MOVW    #0, Counter         ; Else, Initialize counter to 0
            
END_RTI:    BCLR    CRGFLG, #$80        ;
            RTI
            
IRQ_ISR:    LDX     Counter             ; Load counter to Idx X
            INX                         ; Increment Counter
            STX     Counter             ; Store Counter
            CPX     #1000               ; Has the counter reached value?
            BNE     END_RTI             ; If not, exit RTI
            MOVW    #0, Counter         ; Else, Initialize counter to 0
            
END_IRQ:    BCLR    CRGFLG, #$80        ;
            RTI

;--------------------------------
;    KEYBOARD IMPLEMENTATION
;--------------------------------

; 1 ms delay for debouncing is needed
Set_seq:    LDX     Scan_Count          ; Load Scan_Count 
            LDAA    Scan_KeyRow, X      ; Load keyboard sequence
            STAA    port_u              ; Write to Keyboard
            INX                         ;   (Read will happen in 
            CPX     $04                 ;     next interrupts)
            BNE     Exit_set            ; If Scan_Count not maxed, skip
            LDX     #$00                ; If Scan_Count maxed, reset
Exit_set:   STX     Scan_Count          ; Store Scan_Count
            RTS

Scan_seq:   BRCLR   port_u, $0F, Key_Tab; If Key is pressed, go to Key_tab
            RTS

Key_Tab:    MOVB    #$00, key_val       ; Set key_val to 0, & use as index
Key_Lp:     LDAA    KEY_TAB+key_val     ; Load key value and    
            CMPA    port_u              ;    compare to port_u 
            BEQ     Exit_key            ; If match move to exit (key_val is set)
            INC     key_val             ; If no match, increase
            BRCLR   key_val,#$10,Key_Lp ;    key_val and try again
            MOVB    #$FF, key_val       ; If no match, key_val=$FF
Exit_key:   RTS

;--------------------------------
;        STEPPER MOTOR 
;--------------------------------

; 30 ms Delay between each step
CW_Step:    LDAB    Step_Idx            ; If Step_Idx >= $04
            CMPB    $04                 ;    then set to zero
            BLO     CW_Lp               ; Otherwise, skip
            MOVB    #$00, Step_Idx      ; 
CW_Lp:      LDAA    STEP_TAB+Step_Idx   ; Read Sequence and write 
            STAA    port_p              ;    it to Stepper Motor
            INC     Step_Idx            ; Update Index for next time
            RTS

CCW_Step:   LDAB    Step_Idx            ; If Step_Idx >= $04
            CMPB    $00                 ;    then set to zero
            BLO     CW_Lp               ; Otherwise, skip
            MOVB    #$04, Step_Idx      ; 
CCW_Lp:     LDAA    STEP_TAB+Step_Idx   ; Read Sequence and write 
            STAA    port_p              ;    it to Stepper Motor
            DEC     Step_Idx            ; Update Index for next time
            RTS