
; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF user_defaults, usr_EMPTY, reset_Temp

            XREF __SEG_END_SSTACK, usr_0, usr_1, usr_2, usr_3, usr_4, usr_empty

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
                MOVB    #'D', 0, x          ;     Dr. Alan Grant
                MOVB    #'R', 1, x          ;
                MOVB    #' ', 2, x          ;
                MOVB    #'G', 3, x          ;
                MOVB    #'R', 4, x          ;
                MOVB    #'A', 5, x          ;
                MOVB    #'N', 6, x          ;
                MOVB    #'T', 7, x          ;
                ;                           ; Password
                MOVB    #'H', 8, x          ;     HATS
                MOVB    #'A', 9, x          ;
                MOVB    #'T', 10, x         ;
                MOVB    #'S', 11, x         ;
                MOVB    #'-', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                RTS

usr_SATTLER:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'S', 0, x          ;     Dr. Ellie Sattler
                MOVB    #'A', 1, x          ;
                MOVB    #'T', 2, x          ;
                MOVB    #'T', 3, x          ;
                MOVB    #'L', 4, x          ;
                MOVB    #'E', 5, x          ;
                MOVB    #'R', 6, x          ;
                MOVB    #' ', 7, x          ;
                ;                           ; Password
                MOVB    #'P', 8, x          ;     PLANTS
                MOVB    #'L', 9, x          ;
                MOVB    #'A', 10, x         ;
                MOVB    #'N', 11, x         ;
                MOVB    #'T', 12, x         ;
                MOVB    #'S', 13, x         ;
                MOVB    #'-', 14, x         ;
                MOVB    #' ', 15, x         ;
                RTS

usr_MALCOLM:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'M', 0, x          ;     Dr. Ian Malcolm
                MOVB    #'A', 1, x          ;
                MOVB    #'L', 2, x          ;
                MOVB    #'C', 3, x          ;
                MOVB    #'O', 4, x          ;
                MOVB    #'L', 5, x          ;
                MOVB    #'M', 6, x          ;
                MOVB    #' ', 7, x          ;
                ;                           ; Password
                MOVB    #'C', 8, x          ;     CHAOS
                MOVB    #'H', 9, x          ;
                MOVB    #'A', 10, x         ;
                MOVB    #'O', 11, x         ;
                MOVB    #'S', 12, x         ;
                MOVB    #'-', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                RTS

usr_EMPTY:      LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'E', 0, x          ;     EMPTY
                MOVB    #'M', 1, x          ;
                MOVB    #'P', 2, x          ;
                MOVB    #'T', 3, x          ;
                MOVB    #'Y', 4, x          ;
                MOVB    #' ', 5, x          ;
                MOVB    #' ', 6, x          ;
                MOVB    #' ', 7, x          ;
                ;                           ; Password
                MOVB    #'-', 8, x          ;
                MOVB    #' ', 9, x          ;
                MOVB    #' ', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                RTS

usr_VISIT:      LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; User Name
                MOVB    #'V', 0, x          ;     Visitor
                MOVB    #'I', 1, x          ;
                MOVB    #'S', 2, x          ;
                MOVB    #'I', 3, x          ;
                MOVB    #'T', 4, x          ;
                MOVB    #'O', 5, x          ;
                MOVB    #'R', 6, x          ;
                MOVB    #' ', 7, x          ;
                ;                           ; Password
                MOVB    #'-', 8, x          ;    No password
                MOVB    #' ', 9, x          ;
                MOVB    #' ', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                RTS

reset_Temp:     LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                MOVB    #' ', 0, x            ;   
                MOVB    #' ', 1, x            ;
                MOVB    #' ', 2, x            ;
                MOVB    #' ', 3, x            ;
                MOVB    #' ', 4, x            ;
                MOVB    #' ', 5, x            ;
                MOVB    #' ', 6, x            ;
                MOVB    #' ', 7, x            ;
                RTS