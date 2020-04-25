; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF RTI_ISR, IRQ_ISR

            XREF __SEG_END_SSTACK, RTI_Cnter, port_u, Scan_Count, Scan_KeyRow, key_val, KEY_TAB, port_p, Step_Idx, STEP_TAB



;--------------------------------
;          SUB-ROUTINES
;--------------------------------

;--------------------------------
;           INTERRUPTS
;--------------------------------

RTI_ISR:    LDX     RTI_Cnter           ; Load counter to Idx X
            INX                         ; Increment Counter
            STX     RTI_Cnter           ; Store Counter
            CPX     #1000               ; Has the counter reached value?
            BNE     END_RTI             ; If not, exit RTI
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

;--------------------------------
;    KEYBOARD IMPLEMENTATION
;--------------------------------
;
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

Scan_seq:   BRCLR   port_u, $0F,Key_Read; If Key is pressed, go to Key_Read
            RTS

Key_Read:   MOVB    #$00, key_val       ; Set key_val to 0, & use as index
Key_Lp:     LDX     key_val             ;
            LDAA    KEY_TAB, x          ; Load key value and    
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