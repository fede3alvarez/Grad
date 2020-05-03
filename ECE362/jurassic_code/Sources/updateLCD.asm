; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF default_disp, menu_disp, newAcc_disp, delAcc_disp, login_disp, whereToGo_disp, aqua_disp, garden_disp, safari_disp, menu_tutorial, visit_disp, log_usr_sel, log_usr_shift, FAIL_PASSWORD, no_empty_disp, newUsr_done
            XREF disp, display_string    

default_disp:   MOVB #' ',disp
                MOVB #' ',disp+1
                MOVB #' ',disp+2
                MOVB #' ',disp+3
                MOVB #'W',disp+4
                MOVB #'E',disp+5
                MOVB #'L',disp+6
                MOVB #'C',disp+7
                MOVB #'O',disp+8
                MOVB #'M',disp+9
                MOVB #'E',disp+10
                MOVB #' ',disp+11
                MOVB #'T',disp+12
                MOVB #'O',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                MOVB #' ',disp+16
                MOVB #' ',disp+17
                MOVB #'J',disp+18
                MOVB #'U',disp+19
                MOVB #'R',disp+20
                MOVB #'A',disp+21
                MOVB #'S',disp+22
                MOVB #'S',disp+23
                MOVB #'I',disp+24
                MOVB #'C',disp+25
                MOVB #' ',disp+26
                MOVB #'P',disp+27
                MOVB #'A',disp+28
                MOVB #'R',disp+29
                MOVB #'K',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

menu_tutorial:  MOVB #'N',disp
                MOVB #'A',disp+1
                MOVB #'V',disp+2
                MOVB #'I',disp+3
                MOVB #'G',disp+4
                MOVB #'A',disp+5
                MOVB #'T',disp+6
                MOVB #'E',disp+7
                MOVB #':',disp+8
                MOVB #'P',disp+9
                MOVB #'O',disp+10
                MOVB #'T',disp+11
                MOVB #'M',disp+12
                MOVB #'E',disp+13
                MOVB #'T',disp+14
                MOVB #'R',disp+15
                MOVB #'E',disp+16
                MOVB #'N',disp+17
                MOVB #'T',disp+18
                MOVB #'E',disp+19
                MOVB #'R',disp+20
                MOVB #': ',disp+21
                MOVB #'P',disp+22
                MOVB #'R',disp+23
                MOVB #'E',disp+24
                MOVB #'S',disp+25
                MOVB #'S',disp+26
                MOVB #'',disp+27
                MOVB #'K',disp+28
                MOVB #'E',disp+29
                MOVB #'Y',disp+30
                MOVB #'P ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

menu_disp:      MOVB #'R',disp+16
                MOVB #'/',disp+17
                MOVB #'L',disp+18
                MOVB #':',disp+19
                MOVB #'P',disp+20
                MOVB #'O',disp+21
                MOVB #'T',disp+22
                MOVB #' ',disp+23
                MOVB #'S',disp+24
                MOVB #'E',disp+25
                MOVB #'L',disp+26
                MOVB #':',disp+27
                MOVB #'K',disp+28
                MOVB #'E',disp+29
                MOVB #'Y',disp+30
                MOVB #'P',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

newAcc_disp:    MOVB #'C',disp
                MOVB #'R',disp+1
                MOVB #'E',disp+2
                MOVB #'A',disp+3
                MOVB #'T',disp+4
                MOVB #'E',disp+5
                MOVB #' ',disp+6
                MOVB #'N',disp+7
                MOVB #'E',disp+8
                MOVB #'W',disp+9
                MOVB #' ',disp+10
                MOVB #'U',disp+11
                MOVB #'S',disp+12
                MOVB #'E',disp+13
                MOVB #'R',disp+14
                MOVB #'?',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

delAcc_disp:    MOVB #'D',disp
                MOVB #'E',disp+1
                MOVB #'L',disp+2
                MOVB #'E',disp+3
                MOVB #'T',disp+4
                MOVB #'E',disp+5
                MOVB #' ',disp+6
                MOVB #'U',disp+7
                MOVB #'S',disp+8
                MOVB #'E',disp+9
                MOVB #'R',disp+10
                MOVB #'?',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

login_disp:     MOVB #'L',disp
                MOVB #'O',disp+1
                MOVB #'G',disp+2
                MOVB #'I',disp+3
                MOVB #'N',disp+4
                MOVB #'?',disp+5
                MOVB #' ',disp+6
                MOVB #' ',disp+7
                MOVB #' ',disp+8
                MOVB #' ',disp+9
                MOVB #' ',disp+10
                MOVB #' ',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

visit_disp:     MOVB #'V',disp
                MOVB #'I',disp+1
                MOVB #'S',disp+2
                MOVB #'I',disp+3
                MOVB #'T',disp+4
                MOVB #'O',disp+5
                MOVB #'R',disp+6
                MOVB #'?',disp+7
                MOVB #'(',disp+8
                MOVB #'N',disp+9
                MOVB #'O',disp+10
                MOVB #'',disp+11
                MOVB #'U',disp+12
                MOVB #'S',disp+13
                MOVB #'R',disp+14
                MOVB #')',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

whereToGo_disp: MOVB #' ',disp
                MOVB #' ',disp+1
                MOVB #'W',disp+2
                MOVB #'H',disp+3
                MOVB #'E',disp+4
                MOVB #'R',disp+5
                MOVB #'E',disp+6
                MOVB #' ',disp+7
                MOVB #'T',disp+8
                MOVB #'O',disp+9
                MOVB #' ',disp+10
                MOVB #'G',disp+11
                MOVB #'O',disp+12
                MOVB #'?',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

aqua_disp:      MOVB #' ',disp+16
                MOVB #' ',disp+17
                MOVB #' ',disp+18
                MOVB #'A',disp+19
                MOVB #'Q',disp+20
                MOVB #'U',disp+21
                MOVB #'A',disp+22
                MOVB #'R',disp+23
                MOVB #'I',disp+24
                MOVB #'U',disp+25
                MOVB #'M',disp+26
                MOVB #'?',disp+27
                MOVB #' ',disp+28
                MOVB #' ',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

garden_disp:    MOVB #'B',disp+16
                MOVB #'O',disp+17
                MOVB #'T',disp+18
                MOVB #'A',disp+19
                MOVB #'N',disp+20
                MOVB #'I',disp+21
                MOVB #'C',disp+22
                MOVB #'.',disp+23
                MOVB #' ',disp+24
                MOVB #'G',disp+25
                MOVB #'A',disp+26
                MOVB #'R',disp+27
                MOVB #'D',disp+28
                MOVB #'E',disp+29
                MOVB #'N',disp+30
                MOVB #'?',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

safari_disp:    MOVB #' ',disp+16
                MOVB #' ',disp+17
                MOVB #'S',disp+18
                MOVB #'A',disp+19
                MOVB #'F',disp+20
                MOVB #'A',disp+21
                MOVB #'R',disp+22
                MOVB #'I',disp+23
                MOVB #' ',disp+24
                MOVB #'T',disp+25
                MOVB #'R',disp+26
                MOVB #'I',disp+27
                MOVB #'P',disp+28
                MOVB #'?',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

log_usr_sel:    MOVB #'S',disp
                MOVB #'E',disp+1
                MOVB #'L',disp+2
                MOVB #'E',disp+3
                MOVB #'C,disp+4
                MOVB #'T',disp+5
                MOVB #' ',disp+6
                MOVB #'U',disp+7
                MOVB #'S',disp+8
                MOVB #'E',disp+9
                MOVB #'R',disp+10
                MOVB #' ',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

log_usr_shift:  LDX  2, SP          ; Load Stack on Indx X
                MOVB x+, disp+16    ; Idx X has to be loaded
                MOVB x+, disp+17    ; with the user start addres
                MOVB x+, disp+18
                MOVB x+, disp+19
                MOVB x+, disp+20
                MOVB x+, disp+21
                MOVB x+, disp+22
                MOVB x+, disp+23
                MOVB #' ',disp+24
                MOVB #' ',disp+25
                MOVB #' ',disp+26
                MOVB #' ',disp+27
                MOVB #' ',disp+28
                MOVB #' ',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

ENTER_PASSWORD: MOVB #'E',disp
                MOVB #'N',disp+1
                MOVB #'T',disp+2
                MOVB #'E',disp+3
                MOVB #'R',disp+4
                MOVB #' ',disp+5
                MOVB #'P',disp+6
                MOVB #'A',disp+7
                MOVB #'S',disp+8
                MOVB #'S',disp+9
                MOVB #'W',disp+10
                MOVB #'O',disp+11
                MOVB #'R',disp+12
                MOVB #'D',disp+13
                MOVB #':',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

SUCC_PASSWORD:  MOVB #'P',disp
                MOVB #'A',disp+1
                MOVB #'S',disp+2
                MOVB #'S',disp+3
                MOVB #'W',disp+4
                MOVB #'O',disp+5
                MOVB #'R',disp+6
                MOVB #'D',disp+7
                MOVB #' ',disp+8
                MOVB #'A',disp+9
                MOVB #'P',disp+10
                MOVB #'P',disp+11
                MOVB #'R',disp+12
                MOVB #'O',disp+13
                MOVB #'V',disp+14
                MOVB #'E',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

FAIL_PASSWORD:  MOVB #'W',disp
                MOVB #'R',disp+1
                MOVB #'O',disp+2
                MOVB #'N',disp+3
                MOVB #'G',disp+4
                MOVB #' ',disp+5
                MOVB #'P',disp+6
                MOVB #'A',disp+7
                MOVB #'S',disp+8
                MOVB #'S',disp+9
                MOVB #'W',disp+10
                MOVB #'O',disp+11
                MOVB #'R',disp+12
                MOVB #'D',disp+13
                MOVB #'!',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

ATTEMPT_PASS:   MOVB pass_temp,disp
                MOVB #' ',disp+8
                MOVB #' ',disp+9
                MOVB #' ',disp+10
                MOVB #' ',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

no_empty_disp:  MOVB #'T',disp
                MOVB #'H',disp+1
                MOVB #'E',disp+2
                MOVB #'R',disp+3
                MOVB #'E',disp+4
                MOVB #' ',disp+5
                MOVB #'A',disp+6
                MOVB #'R',disp+7
                MOVB #'E',disp+8
                MOVB #'',disp+9
                MOVB #'N',disp+10
                MOVB #'O',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
                MOVB #' ',disp+16
                MOVB #'E',disp+17
                MOVB #'M',disp+18
                MOVB #'P',disp+19
                MOVB #'T',disp+20
                MOVB #'Y',disp+21
                MOVB #' ',disp+22
                MOVB #'A',disp+23
                MOVB #'C',disp+24
                MOVB #'C',disp+25
                MOVB #'O',disp+26
                MOVB #'N',disp+27
                MOVB #'T',disp+28
                MOVB #'S',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS

newAcc_disp:    MOVB #'C',disp
                MOVB #'R',disp+1
                MOVB #'E',disp+2
                MOVB #'A',disp+3
                MOVB #'T',disp+4
                MOVB #'E',disp+5
                MOVB #' ',disp+6
                MOVB #'N',disp+7
                MOVB #'E',disp+8
                MOVB #'W',disp+9
                MOVB #' ',disp+10
                MOVB #'U',disp+11
                MOVB #'S',disp+12
                MOVB #'E',disp+13
                MOVB #'R',disp+14
                MOVB #'?',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

newUsr_done:    MOVB #'K',disp
                MOVB #'E',disp+1
                MOVB #'Y',disp+2
                MOVB #' ',disp+3
                MOVB #'T',disp+4
                MOVB #'W',disp+5
                MOVB #'I',disp+6
                MOVB #'C',disp+7
                MOVB #'E',disp+8
                MOVB #' ',disp+9
                MOVB #'4',disp+10
                MOVB #' ',disp+11
                MOVB #'D',disp+12
                MOVB #'O',disp+13
                MOVB #'N',disp+14
                MOVB #'E',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

newUsr_disp:    MOVB #'E',disp
                MOVB #'N',disp+1
                MOVB #'T',disp+2
                MOVB #'E',disp+3
                MOVB #'R',disp+4
                MOVB #' ',disp+5
                MOVB #'U',disp+6
                MOVB #'S',disp+7
                MOVB #'R',disp+8
                MOVB #' ',disp+9
                MOVB #'(',disp+10
                MOVB #'8',disp+11
                MOVB #'C',disp+12
                MOVB #'H',disp+13
                MOVB #'R',disp+14
                MOVB #')',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

ATTEMPT_USR:    MOVB usr_temp,disp+16
                MOVB #' ',disp+24
                MOVB #' ',disp+25
                MOVB #' ',disp+26
                MOVB #' ',disp+27
                MOVB #' ',disp+28
                MOVB #' ',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0' 
                LDD  #disp         
                JSR  display_string
                RTS