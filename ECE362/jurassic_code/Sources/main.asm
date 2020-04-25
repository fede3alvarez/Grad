; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry,
            ;
            ;----Interrupt--------------
            RTI_Cnter,
            ;
            ;-----Keyboard ------------- 
            port_u,                     
            Scan_Count, Scan_KeyRow, 
            key_val, KEY_TAB,
            ;
            ;-----STEPPER MOTOR---------
            port_p,
            Step_Idx, STEP_TAB

            XREF __SEG_END_SSTACK,      

; variable/data section
MY_EXTENDED_RAM:    SECTION
                ORG   $800
;-------------ISR Parameters---------------;
RTI_Cnter:        ds.w    1

;---Stepper Motor Parameters / port_p------;
STEP_TAB:       dc.b    $0A, $12, $14, $0C
Step_Idx:       ds.b    1

;--------Keyboard Parameters / port_u------;
; Table with key value
KEY_TAB:        dc.b    $eb, $77, $7b, $7d, $b7, $bb, $bd, $d7, $db, $dd, $e7, $ed, $7e, $be, $de, $ee
Scan_KeyRow:    dc.b    $70, $B0, $D0, $E0    ; Scan Sequence for Keyboard
Scan_Count:     ds.w    1                     ; Index when Scanning Keyboard
key_press:      ds.b    1                     ; Indicator that a key has been recently pressed
key_val:        ds.b    1                     ; Key Value


MY_CONSTANT_ROM: SECTION
;--------Port settings------------;
; Keyboard Parameters / port_u
port_u:         equ     $268                  
ddr_u:          equ     $26A                   
psr_u:          equ     $26D
peru_u:         equ     $26C
;
; Stepper Motor / port_p
port_p:         equ     $258
ddr_p:          equ     $25A

; Code section
MyCode:             SECTION
Entry:
            LDS     #__SEG_END_SSTACK       ; Initialize stack
            
            ;-----Stepper Motor; Setup--------;
            MOVB    #$3E, ddr_p             ; port p / Stepper motor setup
            MOVB    #$00, Step_Idx          ; Stepper motor Sequence Index

            ;-------Keyboard Setup----------;
            BSET    ddr_u, #$F0             ; port u (keyboard) / DDR, set as input
            BSET    peru_u, #$0F            ; port u (keyboard) / PER, Set as pull-up/down
            BSET    psr_u, #$F0             ; port u (keyboard) / PDR, set as pull-up
            MOVW    #$00, Scan_Count        ; initialize the counter
            
            ;-------Interrupts Setup--------;
            MOVB    #$80, CRGINT            ; Enable RTI
            MOVB    #$40, RTICTL            ; Set RTI to 1 ms
            CLI                             ; Initialize Interrupts
        
Main_Loop:  NOP                             
            BRA     Main_Loop

            END