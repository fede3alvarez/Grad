; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF user_main

            XREF __SEG_END_SSTACK, user_sel, menu_disp, menu_tutorial, key_val, usr_menu_shift, usr_menu_max, USR_MENU_INPUT, usr_input, visit_disp, log_usr_sel, log_usr_shift

user_main:  JSR     menu_tutorial                   ; Load tutorial LCD instructions
            MOVB    #$FF, key_val                   ; Reset Key values


tutorial:   JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,tutorial          ; Otherwise, stay in tutorial

usr_mnuSt   JSR     menu_disp                       ; Set bottom side of LCD
            JSR     login_disp                      ; Display Login Quest
            ;                                       ;  to instructions (stay that
            ;                                       ;  wait until next step is choosen)

user_menu:  JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,user_menu         ; 
            ;                                       ; If pot_shift is zero,
            LDAA    pot_shift                       ;   key is pressed, and go to select menu
            BEQ     usr_mnuSel                      ; Else pot_shift is not zero,  
            MOVB    #$00, pot_shift                 ;   set pot_shift to zero (value now stale)
            LDAA    usr_menu_shift                  ;
            LBEQ    login_disp                      ; Based on the value of 
            CMPA    $01                             ;   usr_menu_shift
            LBEQ    newAcc_disp                     ;   Go to the appropriate Menu
            CMPA    $02                             ;
            LBEQ    delAcc_disp                     ;
            CMPA    $03                             ;
            LBEQ    visit_disp                      ;
            INCA                                    ; Increase usr_menu_shift
            LBLO     $04, user_menu                 ;
            MOVB    #$00, usr_menu_shift            ;
            LBRA    user_menu                       ;
            ;                                       ;
usr_mnuSel: LDAA    usr_menu_shift                  ;
            LBEQ    usr_login                       ; Based on the value of 
            CMPA    $01                             ;   usr_menu_shift
            LBEQ    usr_newAcc                      ;   Go to the appropriate Menu
            CMPA    $02                             ;
            LBEQ    usr_delAcc                      ;
            CMPA    $03                             ;
            LBEQ    usr_visit                       ;
            ;                                       ;
usr_login:  JSR     log_usr_sel                     ; Display login screen
            LDAA    usr_sel_acc                     ;   for a particular user
            LBNE    usr1_chk                        ; Based on the value of 
            LDX     #usr_0                          ;   usr_sel_acc
            LBRA    usr_chk_end                     ;
usr1_chk:   CMPA    $01                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_1                          ;
            LBRA    usr_chk_end                     ;
usr2_chk:   CMPA    $02                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_2                          ;
            LBRA    usr_chk_end                     ;
usr3_chk:   LDX     #usr_3                          ;
usr_chk_end:JSR     log_usr_shift                   ;
            ;                                       ;
usr_log_wt: JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,usr_log_wt        ;
            ;                                       ; If pot_shift is zero,
            LDAA    pot_shift                       ;   key is pressed, and go to enter password
            LBEQ    usr_pass                        ; Else pot_shift is not zero,  
            MOVB    #$00, pot_shift                 ;   set pot_shift to zero (value now stale)
            ;                                       ;
            LDAA    usr_sel_acc                     ; Update usr_sel_acc
            INCA                                    ;   and loop back to usr_login
            CMPA    usr_max                         ;
            LBLO    usr_login                       ;
            MOVB    #$00, usr_sel_acc               ;
            LBRA    usr_login                       ;
            ;                                       ;
usr_pass:   JSR     ENTER_PASSWORD                  ; Load Password address on Idx X
            LDAA    usr_sel_acc                     ;   for a particular user
            LBNE    pass1_chk                       ; Based on the value of 
            LDX     #usr_0                          ;   usr_sel_acc
            LBRA    pass_chk_end                    ;
pass1_chk:  CMPA    $01                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_1                          ;
            LBRA    pass_chk_end                    ;
pass2_chk:  CMPA    $02                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_2                          ;
            LBRA    pass_chk_end                    ;
pass3_chk:  LDX     #usr_3                          ;
            LDAA    8, x                            ;
            STAA    pass_char                       ;
            CMPA    #'-',                           ;
            LBEQ    pass_succ                       ;
            ;                                       ;
            ;                                       ;
            ;                                       ;
pass_succ:  JSR     log_usr_shift                   ; Display Password Success
            JSR     SUCC_PASSWORD                   ;   Screen and wait for user
            MOVB    #$FF, key_val                   ;   input to continue
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
pass_ext_wt:JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,pass_ext_wt       ;


usr_newAcc:

usr_visit:



    


            NOP
            BRA 
