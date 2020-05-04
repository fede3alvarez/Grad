; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Main_Logic, USR_MENU_INPUT, trip

            XREF __SEG_END_SSTACK, user_sel, key_val, pot_shift, usr_input, user_main, JEEP_TUTORIAL, whereToGo_disp, aqua_disp, garden_disp, safari_disp, LOC_TRACK, JEEP_MODE, botanical_park, aquarium_park, safari_park


Main_Logic:     LDAA    user_sel                ; Check if user has been selected
                LBEQ    user_main               ; If not, go user user_setup
                LBRA    trip

trip:           JSR     whereToGo_disp          ;whereToGo_disp, aqua_disp, garden_disp, safari_disp
                JSR     aqua_disp               ;
                ;                               ;
                MOVB    #$FF, key_val           ;
                MOVB    #$00, pot_shift         ;
                ;                               ;
trip_wt:        JSR     USR_MENU_INPUT          ; Check if user pressed somthing
                BRCLR   usr_input,$FF,trip_wt   ;
                ;                               ;
                LDAA    pot_shift               ; If not is pressed, then 
                LBEQ    trip_jeep               ;   the location has been selected
                ;                               ;
                CMPA    $02                     ;
                BNE     LOC_dwn                 ;
                INC     LOC_TRACK               ;    
                LBRA    Aqua_chk                ;
                ;                               ;
LOC_dwn:        CMPA    $04                     ;
                BNE     Aqua_chk                ;
                DEC     LOC_TRACK               ;    
                ;                               ;
Aqua_chk:       LDAA    LOC_TRACK               ;
                LBNE    Garden_chk              ;
                JSR     aqua_disp               ;
                LBRA    trip_wt                 ;
Garden_chk:     CMPA    $01                     ;
                LBNE    Safari_chk              ;
                JSR     garden_disp             ;  
                LBRA    trip_wt                 ;
Safari_chk:     CMPA    $02                     ;
                LBNE    Reset_LOC               ;
                JSR     safari_disp             ;  
                LBRA    trip_wt                 ;
Reset_LOC:      MOVB    $00, LOC_TRACK          ;
                LBRA    Aqua_chk                ;      
                
trp_jeep_tut:   JSR     JEEP_TUTORIAL           ; Display JEEP Tutorial screen
                MOVB    #$FF, JEEP_MODE         ;   Set JEEP_MODE to True
trip_jeep:      BRSET   JEEP_MODE,#$FF,trip_jeep; Wait until Jeep Mode is FALSE
                LBRA    select_park             ;   to Load Park

select_park:    LDAA    LOC_TRACK
                CMPA    $02
                LBNE    go_garden
                LBRA    safari_park
go_garden:      CMPA    $01          
                LBNE    go_aqua
                LBRA    botanical_park
go_aqua:        LBRA    aquarium_park

USR_MENU_INPUT: LDAA    key_val                 ; Subrountine to check if
                COMA                            ;    Keypad is pressed
                ORAA    pot_shift               ;    or Pot shifts 
                STAA    usr_input               ; Note: Key_val & pot_shift
                RTS                             ; Are NOT set to notUpdate here
                                                ; to be use in elsewhere logic