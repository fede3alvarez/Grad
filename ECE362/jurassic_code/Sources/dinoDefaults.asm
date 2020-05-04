
; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF default_dino
            XREF __SEG_END_SSTACK, aqua_1, aqua_2, aqua_3, veggie_1, veggie_2, veggie_3, carniv_1, carniv_2, carniv_3 

;-----------------------------------;
;           user_defaults           ;
;-----------------------------------;
; This file populates the user      ;
; login information                 ;
;-----------------------------------;

user_defaults:  
                LDX     #aqua_1             ; EASY
                PSHX                        ;  
                JSR     Nothosaurs          ;
                
                LDX     #aqua_2             ; Medium
                PSHX                        ; 
                JSR     Plesiosaurs         ;    
                
                LDX     #aqua_3             ; Hard
                PSHX                        ;   
                JSR     Elasmosaurus        ;

                LDX     #veggie_1           ; EASY
                PSHX                        ;  
                JSR     Stegosaurus         ;
                
                LDX     #veggie_2           ; Medium
                PSHX                        ; 
                JSR     Triceratops         ;    
                
                LDX     #veggie_3           ; Hard
                PSHX                        ;   
                JSR     Diplodocus          ;
                
                LDX     #carniv_1           ; HARD
                PSHX                        ;  
                JSR     Spinosaurus         ;
                
                LDX     #carniv_2           ; Medium
                PSHX                        ; 
                JSR     Velociraptor        ;    
                
                LDX     #carniv_3           ; Hard
                PSHX                        ;   
                JSR     T-Rex               ;
                
                RTS


Nothosaurs:     LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'N', 0, x          ;     Nothosaurs
                MOVB    #'O', 1, x          ;
                MOVB    #'T', 2, x          ;
                MOVB    #'H', 3, x          ;
                MOVB    #'O', 4, x          ;
                MOVB    #'S', 5, x          ;
                MOVB    #'A', 6, x          ;
                MOVB    #'U', 7, x          ;
                MOVB    #'R', 8, x          ;
                MOVB    #'S', 9, x          ;
                MOVB    #' ', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $00, 16, x          ; Food Type = FISH
                MOVB    $FF, 17, x          ; Health = FULL Bar
                RTS


Plesiosaurs:    LDX     2, SP              ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'P', 0, x          ;     Plesiosaurs
                MOVB    #'L', 1, x          ;
                MOVB    #'E', 2, x          ;
                MOVB    #'S', 3, x          ;
                MOVB    #'I', 4, x          ;
                MOVB    #'O', 5, x          ;
                MOVB    #'S', 6, x          ;
                MOVB    #'A', 7, x          ;
                MOVB    #'U', 8, x          ;
                MOVB    #'R', 9, x          ;
                MOVB    #'S', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $00, 16, x          ; Food Type = FISH
                MOVB    $0F, 17, x          ; Health = Half Bar
                RTS


Elasmosaurus:   LDX     2, SP              ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'E', 0, x          ;     Plesiosaurs
                MOVB    #'L', 1, x          ;
                MOVB    #'A', 2, x          ;
                MOVB    #'S', 3, x          ;
                MOVB    #'M', 4, x          ;
                MOVB    #'O', 5, x          ;
                MOVB    #'S', 6, x          ;
                MOVB    #'A', 7, x          ;
                MOVB    #'U', 8, x          ;
                MOVB    #'R', 9, x          ;
                MOVB    #'U', 10, x         ;
                MOVB    #'S', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $00, 16, x          ; Food Type = FISH
                MOVB    $07, 17, x          ; Health = 3/8 LEDS
                RTS


Stegosaurus:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'S', 0, x          ;     Stegosaurus
                MOVB    #'T', 1, x          ;
                MOVB    #'E', 2, x          ;
                MOVB    #'G', 3, x          ;
                MOVB    #'O', 4, x          ;
                MOVB    #'S', 5, x          ;
                MOVB    #'A', 6, x          ;
                MOVB    #'U', 7, x          ;
                MOVB    #'R', 8, x          ;
                MOVB    #'U', 9, x          ;
                MOVB    #'S', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $01, 16, x          ; Food Type = BROCOLI
                MOVB    $FF, 17, x          ; Health = FULL Bar
                RTS


Triceratops:    LDX     2, SP              ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'T', 0, x          ;     Triceratops
                MOVB    #'R', 1, x          ;
                MOVB    #'I', 2, x          ;
                MOVB    #'C', 3, x          ;
                MOVB    #'E', 4, x          ;
                MOVB    #'R', 5, x          ;
                MOVB    #'A', 6, x          ;
                MOVB    #'T', 7, x          ;
                MOVB    #'O', 8, x          ;
                MOVB    #'P', 9, x          ;
                MOVB    #'S', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $01, 16, x          ; Food Type = BROCOLI
                MOVB    $0F, 17, x          ; Health = Half Bar
                RTS


Diplodocus:      LDX     2, SP              ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'D', 0, x          ;     Diplodocus
                MOVB    #'I', 1, x          ;
                MOVB    #'P', 2, x          ;
                MOVB    #'L', 3, x          ;
                MOVB    #'O', 4, x          ;
                MOVB    #'D', 5, x          ;
                MOVB    #'O', 6, x          ;
                MOVB    #'C', 7, x          ;
                MOVB    #'U', 8, x          ;
                MOVB    #'S', 9, x          ;
                MOVB    #' ', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $01, 16, x          ; Food Type = BROCOLI
                MOVB    $07, 17, x          ; Health = 3/8 LEDS
                RTS

Spinosaurus:    LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'S', 0, x          ;     Spinosaurus
                MOVB    #'P', 1, x          ;
                MOVB    #'I', 2, x          ;
                MOVB    #'N', 3, x          ;
                MOVB    #'O', 4, x          ;
                MOVB    #'S', 5, x          ;
                MOVB    #'A', 6, x          ;
                MOVB    #'U', 7, x          ;
                MOVB    #'R', 8, x          ;
                MOVB    #'U', 9, x          ;
                MOVB    #'S', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $02, 16, x          ; Food Type = STEAK
                MOVB    $07, 17, x          ; Health = 3/8 LEDs
                RTS


Velociraptor:   LDX     2, SP              ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'V', 0, x          ;     Velociraptor
                MOVB    #'E', 1, x          ;
                MOVB    #'L', 2, x          ;
                MOVB    #'O', 3, x          ;
                MOVB    #'C', 4, x          ;
                MOVB    #'I', 5, x          ;
                MOVB    #'R', 6, x          ;
                MOVB    #'A', 7, x          ;
                MOVB    #'T', 8, x          ;
                MOVB    #'O', 9, x          ;
                MOVB    #'R', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $02, 16, x          ; Food Type = STEAK
                MOVB    $0F, 17, x          ; Health = Half Bar
                RTS


T-Rex:          LDX     2, SP               ; Load Stack on Indx X
                ;                           ;
                ;                           ; Dinasaur Name
                MOVB    #'T', 0, x          ;     T-Rex
                MOVB    #'-', 1, x          ;
                MOVB    #'R', 2, x          ;
                MOVB    #'E', 3, x          ;
                MOVB    #'X', 4, x          ;
                MOVB    #' ', 5, x          ;
                MOVB    #' ', 6, x          ;
                MOVB    #' ', 7, x          ;
                MOVB    #' ', 8, x          ;
                MOVB    #' ', 9, x          ;
                MOVB    #' ', 10, x         ;
                MOVB    #' ', 11, x         ;
                MOVB    #' ', 12, x         ;
                MOVB    #' ', 13, x         ;
                MOVB    #' ', 14, x         ;
                MOVB    #' ', 15, x         ;
                MOVB    $02, 16, x          ; Food Type = Steak
                MOVB    $07, 17, x          ; Health = 3/8 LEDS
                RTS

