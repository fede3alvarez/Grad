; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF default_disp
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
                RTS