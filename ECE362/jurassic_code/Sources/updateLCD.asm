; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF default_disp, menu_disp, newAcc_disp, delAcc_disp, login_disp, whereToGo_disp, aqua_disp, garden_disp, safari_disp, menu_tutorial, visit_disp, log_usr_sel, log_usr_shift, FAIL_PASSWORD, no_empty_disp, newUsr_done, ATTEMPT_USR, newUsr_disp, ATTEMPT_PASS, SUCC_PASSWORD, ENTER_PASSWORD, del_Menu_disp, del_conf_disp, post_del_disp, JEEP_TUTORIAL
            XREF disp, display_string, pass_temp, usr_temp, 

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
                MOVB #':',disp+21
                MOVB #'P',disp+22
                MOVB #'R',disp+23
                MOVB #'E',disp+24
                MOVB #'S',disp+25
                MOVB #'S',disp+26
                MOVB #' ',disp+27
                MOVB #'K',disp+28
                MOVB #'E',disp+29
                MOVB #'Y',disp+30
                MOVB #'P',disp+31
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
                MOVB #' ',disp+11
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
                MOVB #'C',disp+4
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
                MOVB 0,x,disp+16
                MOVB 1,x,disp+17
                MOVB 2,x,disp+18
                MOVB 3,x,disp+19
                MOVB 4,x,disp+20
                MOVB 5,x,disp+21
                MOVB 6,x,disp+22
                MOVB 7,x,disp+23
                
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

ATTEMPT_PASS:   LDX  #pass_temp          ; Load Stack on Indx X
                MOVB 0,x,disp
                MOVB 1,x,disp+1
                MOVB 2,x,disp+2
                MOVB 3,x,disp+3
                MOVB 4,x,disp+4
                MOVB 5,x,disp+5
                MOVB 6,x,disp+6
                MOVB 7,x,disp+7
                
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
                MOVB #' ',disp+9
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

ATTEMPT_USR:    LDX  #usr_temp                ; Load Stack on Indx X
                MOVB 0,x,disp+16
                MOVB 1,x,disp+17
                MOVB 2,x,disp+18
                MOVB 3,x,disp+18
                MOVB 4,x,disp+20
                MOVB 5,x,disp+21
                MOVB 6,x,disp+22
                MOVB 7,x,disp+23
                
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

del_Menu_disp:  MOVB #'D',disp
                MOVB #'E',disp+1
                MOVB #'L',disp+2
                MOVB #'E',disp+3
                MOVB #'T',disp+4
                MOVB #'E',disp+5
                MOVB #' ',disp+6
                MOVB #'A',disp+7
                MOVB #'C',disp+8
                MOVB #'C',disp+9
                MOVB #'O',disp+10
                MOVB #'U',disp+11
                MOVB #'N',disp+12
                MOVB #'T',disp+13
                MOVB #':',disp+14
                MOVB #' ',disp+15
                LDD  #disp         
                JSR  display_string
                RTS

del_conf_disp:  MOVB #'C',disp
                MOVB #'O',disp+1
                MOVB #'N',disp+2
                MOVB #'F',disp+3
                MOVB #'I',disp+4
                MOVB #'R',disp+5
                MOVB #'M',disp+6
                MOVB #' ',disp+7
                MOVB #'D',disp+8
                MOVB #'E',disp+9
                MOVB #'L',disp+10
                MOVB #'E',disp+11
                MOVB #'T',disp+12
                MOVB #'E',disp+13
                MOVB #'?',disp+14
                MOVB #' ',disp+15
                MOVB #'K',disp+16
                MOVB #'E',disp+17
                MOVB #'Y',disp+18
                MOVB #':',disp+19
                MOVB #'Y',disp+20
                MOVB #'E',disp+21
                MOVB #'S',disp+22
                MOVB #' ',disp+23
                MOVB #'P',disp+24
                MOVB #'O',disp+25
                MOVB #'T',disp+26
                MOVB #':',disp+27
                MOVB #'N',disp+28
                MOVB #'O',disp+29
                MOVB #' ',disp+30
                MOVB #' ',disp+31
                MOVB #0,  disp+32
                LDD  #disp         
                JSR  display_string
                RTS

post_del_disp:  MOVB #'A',disp
                MOVB #'C',disp+1
                MOVB #'C',disp+2
                MOVB #'O',disp+3
                MOVB #'U',disp+4
                MOVB #'N',disp+5
                MOVB #'T',disp+6
                MOVB #' ',disp+7
                MOVB #'D',disp+8
                MOVB #'E',disp+9
                MOVB #'L',disp+10
                MOVB #'E',disp+11
                MOVB #'T',disp+12
                MOVB #'E',disp+13
                MOVB #'D',disp+14
                MOVB #' ',disp+15
                MOVB #'P',disp+16
                MOVB #'R',disp+17
                MOVB #'E',disp+18
                MOVB #'S',disp+19
                MOVB #'S',disp+20
                MOVB #' ',disp+21
                MOVB #'K',disp+22
                MOVB #'E',disp+23
                MOVB #'Y',disp+24
                MOVB #' ',disp+25
                MOVB #'O',disp+26
                MOVB #'R',disp+27
                MOVB #' ',disp+28
                MOVB #'P',disp+29
                MOVB #'O',disp+30
                MOVB #'T',disp+31
                MOVB #0,  disp+32
                LDD  #disp         
                JSR  display_string
                RTS

JEEP_TUTORIAL:  MOVB #'D',disp
                MOVB #'R',disp+1
                MOVB #'I',disp+2
                MOVB #'V',disp+3
                MOVB #'E',disp+4
                MOVB #' ',disp+5
                MOVB #'T',disp+6
                MOVB #'H',disp+7
                MOVB #'E',disp+8
                MOVB #' ',disp+9
                MOVB #'J',disp+10
                MOVB #'E',disp+11
                MOVB #'E',disp+12
                MOVB #'P',disp+13
                MOVB #'!',disp+14
                MOVB #' ',disp+15
                MOVB #'W',disp+16
                MOVB #'/',disp+17
                MOVB #' ',disp+18
                MOVB #'P',disp+19
                MOVB #'O',disp+20
                MOVB #'T',disp+21
                MOVB #'E',disp+22
                MOVB #'N',disp+23
                MOVB #'T',disp+24
                MOVB #'I',disp+25
                MOVB #'O',disp+26
                MOVB #'M',disp+27
                MOVB #'E',disp+28
                MOVB #'T',disp+29
                MOVB #'E',disp+30
                MOVB #'R',disp+31
                MOVB #0,  disp+32    ;string terminator, acts like '\0'    
                LDD  #disp         
                JSR  display_string
                RTS
