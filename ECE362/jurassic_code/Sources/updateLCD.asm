; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF default_disp, menu_disp, newAcc_disp, delAcc_disp, login_disp, whereToGo_disp, aqua_disp, garden_disp, safari_disp
            XREF disp    

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
                MOVB #'',disp+6
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
                MOVB #'R,disp+10
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
                MOVB #' ,disp+10
                MOVB #' ',disp+11
                MOVB #' ',disp+12
                MOVB #' ',disp+13
                MOVB #' ',disp+14
                MOVB #' ',disp+15
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
                MOVB #''',disp+24
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