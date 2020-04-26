; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF user_setup, user_main

            XREF __SEG_END_SSTACK, user_sel

user_main:  LDAA    user_sel       ; Check if user has been selected


            BEQ     user_setup     ; If not, go user user_setup
            NOP
            BRA 