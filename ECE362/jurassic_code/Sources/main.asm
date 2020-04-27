; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry,RTI_Cnter, port_u, Scan_Count, Scan_KeyRow, key_val, KEY_TAB, port_p, Step_Idx, STEP_TAB, user_sel, disp, JEEP_MODE, pot_shift, old_pot, port_t, DC_cnter, t_on, FAST_SET, Stepper_ON

            XREF __SEG_END_SSTACK, Main_Logic, display_string, pot_value, read_pot, init_LCD, default_disp    

; variable/data section
MY_EXTENDED_RAM:    SECTION
                ORG   $800

;-------------ISR Parameters---------------;
RTI_Cnter:      ds.w    1

;---Stepper Motor Parameters / port_p------;
STEP_TAB:       dc.b    $0A, $12, $14, $0C
Step_Idx:       ds.b    1
Stepper_ON:     ds.b    1

;--------Keyboard Parameters / port_u------;
; Table with key value
KEY_TAB:        dc.b    $eb, $77, $7b, $7d, $b7, $bb, $bd, $d7, $db, $dd, $e7, $ed, $7e, $be, $de, $ee
Scan_KeyRow:    dc.b    $70, $B0, $D0, $E0 ; Scan Sequence for Keyboard
Scan_Count:     ds.w    1                  ; Index when Scanning Keyboard
key_press:      ds.b    1                  ; Indicator that a key has been recently pressed
key_val:        ds.b    1                  ; Key Value

;-------------LCD Parameters---------------;
disp:           ds.b    33

;-------Potentiometer Parameters-----------;
old_pot:        ds.b    1                  ; Previous pot_value
pot_shift:      ds.b    1                  ; Bit 0: 1=Stale, 0=Valid data
;                                          ; $02=RIGHT, $04=LEFT

;--------------DC Motor--------------------;
DC_cnter:       ds.b    1
t_on:           ds.b    1

;---------User / Account Selection---------;
user_sel:       ds.b    1    

;----------Logic & General-----------------;
JEEP_MODE:      ds.b    1                  ; FALSE=MENU / TRUE=JEEP
FAST_SET:       ds.b    1                  ; TRIGGER FAST LOOP on RTI

MY_CONSTANT_ROM: SECTION
;---------------Port settings--------------;
; Keyboard Parameters / port_u
port_u:         equ     $268                  
ddr_u:          equ     $26A                   
psr_u:          equ     $26D
peru_u:         equ     $26C

;--------Stepper Motor / port_p------------;
port_p:         equ     $258
ddr_p:          equ     $25A

;--------------DC Motor--------------------;
port_t:         equ     $240
ddr_t:          equ     $242

; Code section
MyCode:             SECTION
Entry:
            LDS     #__SEG_END_SSTACK       ; Initialize stack
            
            ;-----Stepper Motor; Setup------;
            MOVB    #$3E, ddr_p             ; port p / Stepper motor setup
            MOVB    #$00, Step_Idx          ; Stepper motor Sequence Index
            MOVB    #$FF, Stepper_ON        ; Stepper Motor set to ON

            ;-------Keyboard Setup----------;
            BSET    ddr_u, #$F0             ; port u (keyboard) / DDR, set as input
            BSET    peru_u, #$0F            ; port u (keyboard) / PER, Set as pull-up/down
            BSET    psr_u, #$F0             ; port u (keyboard) / PDR, set as pull-up
            MOVW    #$00, Scan_Count        ; initialize the counter
            
            ;-------Interrupts Setup--------;
            MOVB    #$80, CRGINT            ; Enable RTI
            MOVB    #$40, RTICTL            ; Set RTI to 1 ms
            CLI                             ; Initialize Interrupts
                                   
            ;-------LCD Display-------------;
            JSR     init_LCD                ; Initialize LCD
            JSR     default_disp             ;
            LDD     #disp                   ; Load default display
    	    JSR     display_string          ; Call Subroutine
            
            
            ;-------Potentiometer-----------;
            MOVB    #$00, pot_shift         ; Initialize to no-shift
            MOVB    #$00, old_pot           ; Initialize to zero

            ;-----------DC Motor------------;
            MOVB    #$00, DC_cnter          ; Initialize counter to zero
            MOVB    #$00, t_on              ; Initialize counter to zero

            ;------User / Account Setup-----;
            MOVB    #$00, user_sel          ; Set Default to no user selected

            ;-----Logic & General-----------;
            MOVB    #$00, JEEP_MODE         ; Initialize to MENU Mode (JEEP=$FF)
            MOVB    #$00, FAST_SET          ; Initialize FAST_SET to FALSE
            
            ;------CODE BEGINNING-----------;
Loop:       BRA     Loop
            NOP
            END