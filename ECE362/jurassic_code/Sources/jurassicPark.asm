; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF botanical_park, aquarium_park, safari_park, load_dino_disp

            XREF __SEG_END_SSTACK, LO, aqua_dino, garden_dino, safari_dinoC_TRACK, JEEP_MODE, botanical_park, aquarium_park, safari_park, choose_dino_dsp, aqua_dino, garden_dino, safari_dino, choose_dino_dsp, back_camp_disp, curr_dino, USR_MENU_INPUT, usr_input, pot_shift


aquarium_park:      LDY     aqua_dino                   ;
                    LBRA    choose_dino_1st             ;
                                                        ;
botanical_park:     LDY     garden_dino                 ;
                    LBRA    choose_dino                 ;
                                                        ;
safari_park:        LDY     safari_dino                 ;
                    LBRA    choose_dino                 ;
                                                        ;
choose_dino_1st:    JSR     choose_dino_dsp             ;  curr_dino settings:
                    JSR     back_camp_disp              ;
                    ;                                   ;
choose_dino:        MOVB    #$FF, key_val               ;
                    MOVB    #$00, pot_shift             ;
                    ;                                   ;
choose_dino_wt:     JSR     USR_MENU_INPUT              ; Check if user pressed somthing
                    BRCLR   usr_input,$FF,choose_dino_wt;
                    ;                                   ;
                    LDAA    pot_shift                   ; If pot the same, then key pressed
                    BEQ     feed_dino                   ;    go and feed dinos
                    ;                                   ;
                    CMPA    $02                         ; If pot shifted right
                    LBNE    dino_down                   ;    Increase curr_dino by 2
                    INC     curr_dino                   ; 
                    INC     curr_dino                   ;
                    LBRA    dino_chck                   ; 
                    ;                                   ;
dino_down:          CMPA    $04                         ; If pot shifted left
                    LBNE    dino_chck                   ;    Increase curr_dino by 2
                    DEC     curr_dino                   ; 
                    DEC     curr_dino                   ;
                    ;                                   ; curr_dino settings
dino_chck:          LDAA    curr_dino                   ;   0 = Back to Camp
                    CMPA    $04                         ;   2 = Easy Dino
                    LBLO    dino_low_end                ;   4 = Medium Dino
                    MOVB    #$00, curr_dino             ;   6 = Hard Dino
dino_low_end:       CMPA    $00                         ;
                    LBHS    display_dino                ;
                    MOVB    #$03, curr_dino             ;
display_dino:       CMPA    $00                         ;
                    LBNE    load_dino                   ;
                    JSR     back_camp_disp              ;
                    LBRA    choose_dino                 ;
load_dino:          LDD     curr_dino, Y
                    JSR     load_dino_disp
                    LBRA    choose_dino                 ;




feed_dino:          LBRA    feed_dino                 ;