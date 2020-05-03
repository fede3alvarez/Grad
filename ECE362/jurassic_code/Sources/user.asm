; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF user_main

            XREF __SEG_END_SSTACK, user_sel, menu_disp, menu_tutorial, key_val, usr_menu_shift, usr_menu_max, USR_MENU_INPUT, usr_input, visit_disp, log_usr_sel, log_usr_shift, FAIL_PASSWORD, usr_temp, usr_new_id, usr_empty, ATTEMPT_USR, no_empty_disp, newAcc_disp, usr_max, newUsr_disp, pass_temp, trip, ATTEMPT_PASS, newUsr_done, pass_char, delAcc_disp, SUCC_PASSWORD, usr_0, usr_1, usr_2, usr_3, usr_sel_acc, ENTER_PASSWORD, key_twice, pot_shift, reset_Temp, login_disp, del_Menu_disp, del_conf_disp, post_del_disp, usr_EMPTY


;---------------------------------------------------;
;          USER SETUP (MAIN / OPTIONS MENU)
;---------------------------------------------------;
user_main:  JSR     menu_tutorial                   ; Load tutorial LCD instructions
            MOVB    #$FF, key_val                   ; Reset Key values
            MOVB    #$00, pot_shift                   ; Reset Pot_shift
            MOVB    $00, usr_sel_acc                ; Reset Current User

                                                  
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
            ;                                       ;
            LBEQ    login_disp                      ; Based on the value of 
            ;                                       ;
            CMPA    $01                             ;   usr_menu_shift
            LBEQ    newAcc_disp                     ;   Go to the appropriate Menu
            ;                                       ;
            CMPA    $02                             ;
            LBEQ    delAcc_disp                     ;
            ;                                       ;
            CMPA    $03                             ;
            LBEQ    visit_disp                      ;
            ;                                       ;
            INCA                                    ;
            CMPA    $04                             ; Increase usr_menu_shift
            LBLO    user_menu                       ;
            MOVB    #$00, usr_menu_shift            ;
            LBRA    user_menu                       ;

usr_mnuSel: LDAA    usr_menu_shift                  ;
            LBEQ    usr_login                       ; Based on the value of 
            CMPA    $01                             ;   usr_menu_shift
            LBEQ    usr_newAcc                      ;   Go to the appropriate Menu
            CMPA    $02                             ;
            LBEQ    usr_delAcc                      ;
            CMPA    $03                             ;
            LBEQ    usr_visit                       ;
;---------------------------------------------------;
;                   LOGIN AREA
;---------------------------------------------------;
             ;                                       ;
usr_login:  JSR     log_usr_sel                     ; Display login screen
            LDAA    usr_sel_acc                     ;   for a particular user
            LBNE    usr1_chk                        ; Based on the value of 
            LDX     #usr_0                          ;   usr_sel_acc
            PSHX                                    ;
            LBRA    usr_chk_end                     ;
            ;                                       ;
usr1_chk:   CMPA    $01                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_1                          ;
            PSHX                                    ;
            LBRA    usr_chk_end                     ;
            ;                                       ;
usr2_chk:   CMPA    $02                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_2                          ;
            PSHX                                    ;
            LBRA    usr_chk_end                     ;
            ;                                       ;
usr3_chk:   LDX     #usr_3                          ;
            PSHX                                    ;
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
;---------------------------------------------------;
;                PASSWORD AREA
;---------------------------------------------------;

usr_pass:   JSR     ENTER_PASSWORD                  ; Load Password address on Idx X
            LDX     #pass_temp                      ;
            PSHX                                    ;
            JSR     reset_Temp                      ; Reset Temp String used to enter Password
            JSR     ATTEMPT_PASS                    ; Load Temp String on LCD
            LDAA    usr_sel_acc                     ; 
            LBNE    pass1_chk                       ; Retrieve password for particular user 
            LDX     #usr_0                          ;   based on usr_sel_acc
            PSHX                                    ;
            LBRA    passEndChk                    ;
            ;                                       ;
pass1_chk:  CMPA    $01                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_1                          ;
            PSHX                                    ;
            LBRA    passEndChk                    ;
            ;                                       ;
pass2_chk:  CMPA    $02                             ;
            LBNE    usr2_chk                        ;
            LDX     #usr_2                          ;
            PSHX                                    ;
            LBRA    passEndChk                    ;
pass3_chk:  LDX     #usr_3                          ;
            PSHX                                    ;
            ;                                       ; Acc Idx X = Usr Password curr. Char
            ;                                       ; Acc Idx Y = Password Attempt curr. Char
            ;                                       ;
            LDY     $00                             ; Load temporary password on idx Y 
passEndChk: LDAA    8, x+                           ; Pull password character
            STAA    pass_char                       ; Check if terminator "-"
            CMPA    #'-'                            ;  is present, and if it is
            LBEQ    pass_succ                       ;  exit with successfull message
            ;                                       ;
            LDAA    #'A'                            ;
            STAA    pass_succ, Y                    ;
Char_chck:  LDAB    pot_shift                       ;   set it to "A" and increase / decrease
            MOVB    #$00, pot_shift                 ;   based on pot_shift changes
            CMPB    $02                             ;
            LBNE    Char_down                       ;
            LDAA    pass_temp, Y                    ;
            INCA                                    ;
            STAA    pass_temp                       ;
Char_down:  CMPB    $04                             ;
            LBNE    Char_same                       ;
            LDAA    pass_temp, Y                    ;
            DECA                                    ;
            STAA    pass_temp                       ;
Char_same:  JSR     ATTEMPT_PASS                    ; Display Character
            ;                                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
pass_wt:    JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,pass_wt           ;
            ;                                       ;
            LDAB    pot_shift                       ; If pot changed, user changed
            LBNE    Char_chck                       ;   character, and return to Char_chck
            ;                                       ;
            LDAA    pass_temp, Y                    ; Compare current character to 
            INY                                     ;
            CMPA    pass_char                       ;   password character (& Increase Y)
            LBEQ    passEndChk                      ; If equal, check for next char
            ;                                       ;
            JSR     FAIL_PASSWORD                   ; If not equal, display fail message
            ;                                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
pass_wt_2:  JSR     USR_MENU_INPUT                  ; And wait for user input to start again
            BRCLR   usr_input,$FF,pass_wt_2         ;
            LBRA    usr_pass                        ;
            ;                                       ;
pass_succ:  JSR     log_usr_shift                   ; Display Password Success
            JSR     SUCC_PASSWORD                   ;   Screen and wait for user
            MOVB    #$FF, key_val                   ;   input to continue
            MOVB    #$00, pot_shift                 ;
            MOVB    #$FF, user_sel                  ; Go to next logic state
            LBRA    trip                            ;
            ;                                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
pass_ext_wt:JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,pass_ext_wt       ;
            ;                                       ;
;---------------------------------------------------;
;                NEW ACCOUNT CREATION
;---------------------------------------------------;
            ;                                       ; FIND EMPTY ACCOUNT
usr_newAcc: LDAA    usr_empty                       ; Check each account
            LBEQ    no_emptyAcc                     ;   To make sure it is not empty
            CMPA    $01                             ;   Then load it on IDX X
            LBNE    new_chck1                       ; and set bit on usr_empty to 
            MOVW    #usr_0, usr_new_id              ;   1 (BUSY / USED)
            MOVB    $01, usr_empty                  ;
            LBRA    new_usr                         ;
new_chck1:  CMPA    $02                             ;
            LBNE    new_chck2                       ;
            MOVW    #usr_1, usr_new_id              ;
            MOVB    $02, usr_empty                  ;
            LBRA    new_usr                         ;
new_chck2:  CMPA    $04                             ;
            LBNE    new_chck3                       ;
            MOVW    #usr_2, usr_new_id              ;
            MOVB    $04, usr_empty                  ;
            LBRA    new_usr                         ;
new_chck3:  CMPA    $08                             ;
            LBNE    no_emptyAcc                     ;
            MOVW    #usr_3, usr_new_id              ;
            MOVB    $08, usr_empty                  ;
            LBRA    new_usr                         ;
            ;                                       ;  ENTER NEW ACCOUNT
new_usr:    JSR     newUsr_disp                     ;
            LDX     #usr_temp                       ;
            PSHX                                    ;
            JSR     reset_Temp                      ;
            ;                                       ;
            LDX     #usr_temp                       ;
new_usr_chr:MOVB    #'A',X                          ;
            JSR     ATTEMPT_USR                     ;
            ;                                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
new_usr_wt: JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,new_usr_wt        ;
            JSR     newUsr_done                     ;
            ;                                       ; If key press once, increase
            LDAA    key_val                         ;   key_twice by one
            CMPA    $FF                             ; Assuming that any pot shift change
            LBEQ    usr_wt_agn                      ;   done by the user be long enought
            INC     key_twice                       ;   to be detected twice
            ;                                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;
            ;                                       ;
usr_wt_agn: JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,usr_wt_agn        ;
            ;                                       ;
            LDAA    key_val                         ; If key press twice, go to save_nw_usr
            CMPA    $FF                             ; If key only press once, move to next char
            LBEQ    usr_chr_chg                     ; If no key, then potentiometer, go to usr_chr_chg
            INC     key_twice                       ;        
            LDAB    key_twice                       ;         
            CMPB    $02                             ;
            LBEQ    save_nw_usr                     ;
            INX                                     ;
            LBRA    new_usr_chr                     ;
            ;                                       ;
usr_chr_chg:MOVB    #$00, key_twice                 ;
            LDAB    pot_shift                       ;   set it to "A" and increase / decrease
            MOVB    #$00, pot_shift                 ;   based on pot_shift changes
            CMPB    $02                             ;
            LBNE    usr_chr_dwn                     ;
            INC     0, X                            ;
usr_chr_dwn:CMPB    $04                             ;
            LBNE    new_usr_chr                     ;
            DEC     0, X                            ;
            LBRA    new_usr_chr                     ;
            ;                                       ;
            ;                                       ;
save_nw_usr:MOVB    #$00, key_twice                 ;
            ;                                       ;
            STX     usr_temp                        ;
            LBRA    usr_visit                       ;

no_emptyAcc:JSR     no_empty_disp                   ; Display no empty acc message 
            MOVB    #$00, pot_shift                 ;  
            MOVB    #$FF, key_val                   ;
            MOVB    #$FF, user_sel                  ; Wait for user input

no_empty_wt:JSR     USR_MENU_INPUT                  ; Before going back to the main menu
            BRCLR   usr_input,$FF,no_empty_wt       ;
            LBRA    usr_mnuSt                       ; 
            ;                                       ;
;---------------------------------------------------;
;              DELETE ACCOUNT AREA
;---------------------------------------------------;
            ;                                       ;
            MOVB    $00, usr_sel_acc                ; 
usr_delAcc: JSR     del_Menu_disp                   ; Display deleted screen
            LDAA    usr_sel_acc                     ;   for a particular user
            LBNE    usr1_del                        ; Based on the value of 
            LDY     #usr_0                          ;
            PSHY                                    ; Load on Idx X to trigger display
            LBRA    usr_del_end                     ;   and delete if needed
            ;                                       ;
usr1_del:   CMPA    $01                             ;
            LBNE    usr2_del                        ;
            LDY     #usr_1                          ;
            PSHY                                    ;
            LBRA    usr_del_end                     ;
            ;                                       ;
usr2_del:   CMPA    $02                             ;
            LBNE    usr2_del                        ;
            LDY     #usr_2                          ;
            PSHY                                    ;
            LBRA    usr_del_end                     ;
            ;                                       ;
usr3_del:   LDY     #usr_3                          ;
            PSHY                                    ;
usr_del_end:JSR     log_usr_shift                   ;
            ;                                       ;
            MOVB    #$00, pot_shift                 ;  
            MOVB    #$FF, key_val                   ;
            ;                                       ;
del_log_wt: JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,del_log_wt        ;
            ;                                       ; If pot_shift is zero,
            LDAA    pot_shift                       ;   key is pressed, and go to enter password
            LBEQ    del_con                         ; Else pot_shift is not zero,  
            MOVB    #$00, pot_shift                 ;   set pot_shift to zero (value now stale)
            ;                                       ;
            LDAA    usr_sel_acc                     ; Update usr_sel_acc
            INCA                                    ;   and loop back to usr_login
            CMPA    usr_max                         ;
            LBLO    usr_login                       ;
            MOVB    #$00, usr_sel_acc               ;
            LBRA    usr_login                       ; 
            ;                                       ;
            MOVB    #$00, pot_shift                 ;  
            MOVB    #$FF, key_val                   ;
            ;                                       ;
del_con:    JSR     del_conf_disp                   ;
            JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,del_log_wt        ;
            ;                                       ;
            LDAA    pot_shift                       ; If pot is shift, do not delete
            LBEQ    usr_mnuSt                       ;   and go back to the main menu
            ;                                       ;
            PSHY                                    ;
            JSR     usr_EMPTY                       ;
            MOVB    #$FF, key_val                   ;
            MOVB    #$00, pot_shift                 ;  
            ;                                       ;
            JSR     post_del_disp                   ;
            JSR     USR_MENU_INPUT                  ; Check if user pressed somthing
            BRCLR   usr_input,$FF,del_log_wt        ;
            ;                                       ;
            LBRA    usr_mnuSt                       ;
;---------------------------------------------------;
;              VISITOR AREA (NO PASSWORD)
;---------------------------------------------------;
usr_visit:  MOVB    #$FF, key_val                   ;  Go to next logic state
            MOVB    #$00, pot_shift                 ;
            MOVB    #$FF, user_sel                  ;
            LBRA    trip                            ;

