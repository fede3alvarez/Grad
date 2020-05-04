; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF botanical_park, aquarium_park, safari_park

            XREF __SEG_END_SSTACK, aqua_dino, garden_dino, safari_dino, LOC_TRACK, JEEP_MODE, choose_dino_dsp, back_camp_disp, curr_dino, USR_MENU_INPUT, usr_input, pot_shift, load_dino_disp, key_val, trip, feed_fish_dsp, feed_lamb_dsp, feed_broc_dsp, back_camp_disp2, target_food, curr_hunger, LED_VAL, set_emergency

;-------------------------------------------------------;
;                  CHOOSE PARK
;-------------------------------------------------------;


aquarium_park:      LDY     aqua_dino                   ;
                    LBRA    choose_dino_1st             ;
                                                        ;
botanical_park:     LDY     garden_dino                 ;
                    LBRA    choose_dino                 ;
                                                        ;
safari_park:        LDY     safari_dino                 ;
                    LBRA    choose_dino                 ;
                                                        ;
;-------------------------------------------------------;
;                  CHOOSE DINO
;-------------------------------------------------------;


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
                    LBLO    dino_low_end                ;   4 = Medium Difeed_fish_dsp, feed_lamb_dsp, feed_broc_dsp, back_camp_disp2
                    MOVB    #$03, curr_dino             ;
display_dino:       CMPA    $00                         ;
                    LBNE    load_dino                   ;
                    JSR     back_camp_disp              ;
                    LBRA    choose_dino                 ;
load_dino:          LDD     curr_dino, Y                ;
                    JSR     load_dino_disp              ;
                    LBRA    choose_dino                 ;

;-------------------------------------------------------;
;                  FEEDING DINO AREA
;-------------------------------------------------------;
feed_dino:          LDAA    curr_dino                   ; If curr_dino == 0, then 
                    LBEQ    trip                        ; then, back to trip
                    LDX     curr_dino, Y                ;
                    LDAA    16, X                       ; curr_food
                    STAA    target_food                 ;  0 = FISH
                    LDAA    17, X                       ;  1 = BROCOLI 
                    STAA    curr_hunger                 ;  2 = LAMB
feed_menu:          MOVB    curr_hunger, LED_VAL        ;  3 = Back to camp
                    LDAA    curr_food                   ;
                    LBNE    food_chk_broc               ; 
                    JSR     feed_fish_dsp               ;
                    LBRA    feed_wt                     ;
food_chk_broc:      CMPA    $01                         ;
                    LBNE    food_chk_lamb               ;
                    JSR     feed_broc_dsp               ;
                    LBRA    feed_wt                     ;
food_chk_lamb:      CMPA    $02                         ;
                    LBNE    feed_wt                     ;
                    JSR     feed_lamb_dsp               ;
                    ;                                   ;
food_chk_bad:       CMPA    $03                         ;
                    LBNE    feed_wt                     ;
                    JSR     back_camp_disp2             ;
                    ;                                   ;
                    MOVB    #$FF, key_val               ;
                    MOVB    #$00, pot_shift             ;
                    ;                                   ;
feed_wt:            JSR     USR_MENU_INPUT              ; Check if user pressed somthing
                    BRCLR   usr_input, $FF, feed_wt     ;
                    ;                                   ;
                    LDAA    pot_shift                   ;
                    BEQ     update_game                 ;
                    CMPA    $02                         ;
                    LBNE    food_down                   ;
                    INC     curr_food                   ;
                    LBRA    food_range_chk              ;
                    ;                                   ;
food_down:          CMPA    $04                         ;
                    LBNE    food_range_chk              ;
                    DEC     curr_food                   ;
                    ;                                   ;
food_range_chk:     LDAA    curr_food                   ;
                    CMPA    $04                         ;
                    LBLO    food_range_low              ;
                    MOVB    #$00, curr_food             ;     
food_range_low:     CMPA    $00                         ;
                    LBHI    feed_menu                   ;
                    MOVB    #$03, curr_food             ;     
                    LBRA    feed_menu                   ;
;-------------------------------------------------------;
;               UPDATE DINO STATUS
;-------------------------------------------------------;
update_game:        LDAA    target_food                 ;
                    CMPA    curr_food                   ;
                    BEQ     food_score                  ;
                    INC     curr_hunger                 ;
                    LBRA    status_check                ;
food_score:         DEC     curr_hunger                 ;
status_check:       LDAA    curr_hunger                 ;
                    CMPA    $00                         ;
                    LBLS    loosing_the_game            ;
                    LBRA    feed_menu                   ;

loosing_the_game:   LBRA    set_emergency               ;      
