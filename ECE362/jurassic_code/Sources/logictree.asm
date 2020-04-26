; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Main_Logic

            XREF __SEG_END_SSTACK, user_sel

Main_Logic: LDAA    user_sel       ; Check if user has been selected
            BEQ     user_setup     ; If not, go user user_setup
            NOP
            BRA 