; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Main_Logic, user_main, USR_MENU_INPUT

            XREF __SEG_END_SSTACK, user_sel, key_val, pot_shift, usr_input

Main_Logic:     LDAA    user_sel            ; Check if user has been selected
                BEQ     user_main           ; If not, go user user_setup
                NOP
                BRA 

USR_MENU_INPUT: LDAA    key_val             ; Subrountine to check if
                COMA                        ;    Keypad is pressed
                ORAA    pot_shift           ;    or Pot shifts 
                STAA    usr_input           ; Note: Key_val & pot_shif
                RTS                         ; Are NOT set to notUpdate here
                                            ; to be use in elsewhere logic