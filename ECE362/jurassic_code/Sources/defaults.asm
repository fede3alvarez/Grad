
; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF user_defaults, usr_EMPTY

            XREF __SEG_END_SSTACK, usr_0, usr_1, usr_2, usr_3, usr_4, reset_TempPass, usr_empty

;-----------------------------------;
;           user_defaults           ;
;-----------------------------------;
; This file populates the user      ;
; login information                 ;
;-----------------------------------;

user_defaults:  
                LDX     #usr_0              ; Populate users with data
                PSHX                        ;    and fill usr_empty 
                JSR     usr_GRANT           ;
                BCLR    usr_empty, $01      ;   
                LDX     #usr_1              ; usr_empty is setup on a bit bases
                PSHX                        ; 
                JSR     usr_SATTLER         ;   Bit 0: usr 0
                BCLR    usr_empty, $02      ;   Bit 1: usr 1
                LDX     #usr_2              ;   Bit 2: usr 2
                PSHX                        ;   Bit 3: usr 3 
                JSR     usr_MALCOLM         ;
                BCLR    usr_empty, $04      ;   Bit 4: Never empty (visitor)
                LDX     #usr_3              ;
                PSHX                        ; 
                JSR     usr_EMPTY           ;
                BSET    usr_empty, $08      ;   
                LDX     #usr_4              ;
                PSHX                        ; 
                JSR     usr_VISIT           ;
                BCLR    usr_empty, $0A      ;   
                RTS


usr_GRANT:      LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'D', x+            ;     Dr. Alan Grant
                MOVB    #'R', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #'G', x+            ;
                MOVB    #'R', x+            ;
                MOVB    #'A', x+            ;
                MOVB    #'N', x+            ;
                MOVB    #'T', x+            ;
                ;                           ; Password
                MOVB    #'H', x+            ;     HATS
                MOVB    #'A', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'S', x+            ;
                MOVB    #'-', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                RTS

usr_SATTLER:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'S', x+            ;     Dr. Ellie Sattler
                MOVB    #'A', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'L', x+            ;
                MOVB    #'E', x+            ;
                MOVB    #'R', x+            ;
                MOVB    #' ', x+            ;
                ;                           ; Password
                MOVB    #'P', x+            ;     PLANTS
                MOVB    #'L', x+            ;
                MOVB    #'A', x+            ;
                MOVB    #'N', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'S', x+            ;
                MOVB    #'-', x+            ;
                MOVB    #' ', x+            ;
                RTS

usr_MALCOLM:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'M', x+            ;     Dr. Ian Malcolm
                MOVB    #'A', x+            ;
                MOVB    #'L', x+            ;
                MOVB    #'C', x+            ;
                MOVB    #'O', x+            ;
                MOVB    #'L', x+            ;
                MOVB    #'M', x+            ;
                MOVB    #' ', x+            ;
                ;                           ; Password
                MOVB    #'C', x+            ;     CHAOS
                MOVB    #'H', x+            ;
                MOVB    #'A', x+            ;
                MOVB    #'O', x+            ;
                MOVB    #'S', x+            ;
                MOVB    #'-', x+            ;
                MOVB    #'', ux+            ;
                MOVB    #'', ux+            ;
                RTS

usr_EMPTY:      LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'E', x+            ;     EMPTY
                MOVB    #'M', x+            ;
                MOVB    #'P', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'Y', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                ;                           ; Password
                MOVB    #'-', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                RTS

usr_VISIT:      LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'V', x+            ;     Visitor
                MOVB    #'I', x+            ;
                MOVB    #'S', x+            ;
                MOVB    #'I', x+            ;
                MOVB    #'T', x+            ;
                MOVB    #'O', x+            ;
                MOVB    #'R', x+            ;
                MOVB    #' ', x+            ;
                ;             x+            ; Password
                MOVB    #'-', x+            ;    No password
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                RTS

reset_Temp:     LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                MOVB    #' ', x+            ;   
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                MOVB    #' ', x+            ;
                RTS