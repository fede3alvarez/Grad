; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF CW_Step, CCW_Step
            XREF __SEG_END_SSTACK, port_p      

;--------------------------------
;        STEPPER MOTOR 
;--------------------------------

;---Stepper Motor Parameters / port_p------;
STEP_TAB:   dc.b    $0A, $12, $14, $0C
Step_Idx:   ds.b    1


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