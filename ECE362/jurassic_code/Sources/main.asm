; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry,RTI_Cnter, port_u, Scan_Count, Scan_KeyRow, key_val, KEY_TAB, port_p, Step_Idx, STEP_TAB, user_sel, disp, JEEP_MODE, pot_shift, old_pot, port_t, DC_cnter, t_on, FAST_SET, Stepper_ON, usr_0, usr_1, usr_2, usr_3, usr_4, usr_temp, usr_new_id, usr_empty, usr_max, pass_temp, pass_char, usr_sel_acc, key_twice, JEEP_Cnter, LOC_TRACK, usr_input, usr_menu_shift, port_s, LED_VAL, curr_dino, aqua_dino, garden_dino, safari_dino, aqua_1, aqua_2, aqua_3, veggie_1, veggie_2, veggie_3, carniv_1, carniv_2, carniv_3, curr_food, target_food, curr_hunger, EMERG_MODE, EMRG_Cnter, EMERG_KEY, EMRG_LOOP, JEEP_LOOP

            XREF __SEG_END_SSTACK, Main_Logic, display_string, pot_value, read_pot, init_LCD, default_disp, user_defaults, default_dino

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

;-------------LEDs Parameters---------------;
LED_VAL:        ds.b    1

;-------Potentiometer Parameters-----------;
old_pot:        ds.b    1                  ; Previous pot_value
pot_shift:      ds.b    1                  ; Bit 0: 1=Stale, 0=Valid data
;                                          ; $02=RIGHT, $04=LEFT

;--------------DC Motor--------------------;
DC_cnter:       ds.b    1
t_on:           ds.b    1

;---------User / Account Selection---------;
user_sel:       ds.b    1                  ;     
usr_menu_shift: ds.b    1                  ; Shifts between user menu options    
usr_menu_max:   ds.b    1                  ; Number of User Menu options
usr_sel_acc:    ds.b    1                  ; Number of User Menu options
usr_input:      ds.b    1                  ; Number of User Menu options
usr_max:        ds.b    1                  ; Number of User Menu options
usr_char        ds.b    1                  ; User character (Password)
usr_empty       ds.b    1                  ; Keeps track of empty Accounts
usr_temp        ds.b    1                  ; Temporary display when creating new acc
usr_new_id      ds.w    1                  ; Temp Variable for creating a new acc
pass_char       ds.b    1                  ; Password character (Password)
pass_temp       ds.b    1                  ; Password entered
key_twice       ds.b    1                  ; Password entered
usr_0:          ds.b    $10                ; User Account Space
usr_1:          ds.b    $10                ; User Account Space
usr_2:          ds.b    $10                ; User Account Space
usr_3:          ds.b    $10                ; User Account Space
usr_4:          ds.b    $10                ; User Account Space

;----------Logic & General-----------------;
JEEP_MODE:      ds.b    1                  ; FALSE=MENU / TRUE=JEEP
JEEP_LOOP:      ds.b    1                  ; FALSE=MENU / TRUE=JEEP
JEEP_Cnter:     ds.w    1                  ; Counts ms in JEEP_MODE
FAST_SET:       ds.b    1                  ; TRIGGER FAST LOOP on RTI
LOC_TRACK:      ds.b    1                  ; Keeps Track of location in Park
;                                          ; 0=AQUARIUM, 1=GARDEN, 2= SAFARI, 
EMERG_MODE:     ds.b    1                  ; FALSE=OK / TRUE=DINO ESCAPE
EMERG_KEY:      ds.b    1                  ; FALSE=OK / TRUE=DINO ESCAPE
EMRG_Cnter:     ds.w    1                  ; Counts ms in EMERGENCY Mode
EMRG_LOOP:      ds.b    1                  ; FALSE=MENU / TRUE=JEEP

;----------Dinasaurus Data-----------------;
aqua_1:         ds.b    20                 ;
aqua_2:         ds.b    20                 ;
aqua_3:         ds.b    20                 ;
veggie_1:       ds.b    20                 ;
veggie_2:       ds.b    20                 ;
veggie_3:       ds.b    20                 ;
carniv_1:       ds.b    20                 ;
carniv_2:       ds.b    20                 ;
carniv_3:       ds.b    20                 ;
curr_dino:      ds.b    1                  ; 
curr_food:      ds.b    1                  ; 
curr_hunger:    ds.b    1                  ; 
target_food:    ds.b    1                  ; 
aqua_dino:      ds.w    4                  ;
garden_dino:    ds.w    4                  ;
safari_dino:    ds.w    4                  ;

MY_CONSTANT_ROM: SECTION
;---------------Port settings--------------;
;-----Keyboard Parameters / port_u---------;
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

;-----------------LEDs---------------------;
port_s:         equ     $248
ddr_s:          equ     $24A

;---------------Switches-------------------;
; ALSO port_t                              ;

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
            MOVB    #$47, RTICTL            ; Set RTI to 1 ms
            CLI                             ; Initialize Interrupts
                                   
            ;-------LCD Display-------------;
            JSR     init_LCD                ; Initialize LCD
            JSR     default_disp            ;
            LDD     #disp                   ; Load default display
    	    JSR     display_string          ; Call Subroutine
            
            
            ;-------Potentiometer-----------;
            MOVB    #$00, pot_shift         ; Initialize to no-shift
            MOVB    #$00, old_pot           ; Initialize to zero

            ;-----------DC Motor------------;
            MOVB    #$00, DC_cnter          ; Initialize counter to zero
            MOVB    #$00, t_on              ; Initialize counter to zero
            
            ;-----------LEDs----------------;
            MOVB    #$00, LED_VAL           ; Initialize LEDs to zero
            MOVB    #$FF, ddr_s             ; Initialize LEDs as outputs

            ;------User / Account Setup-----;
            MOVB    #$00, user_sel          ; Set Default to no user selected
            MOVB    #$01, usr_menu_shift    ; Set Default to zero
            MOVB    #$03, usr_menu_max      ; 0=Login / 1=Create / 2=Delete / 3=Visitor
            MOVB    #$00, usr_input         ; Tracks whether user press Key or Pot
            MOVB    #$00, usr_sel_acc       ; Max number of users
            MOVB    #$00, usr_empty         ; No empty users 
            MOVB    #$00, usr_temp          ; Temporary storage of new acc 
            MOVB    #$04, usr_max           ; Max number of users 
            MOVB    #$00, key_twice         ; Keeps track of # of keys pressed
            JSR     user_defaults           ; Setups up default users

            ;-----Logic & General-----------;
            MOVB    #$00, JEEP_MODE         ; Initialize to MENU Mode (JEEP=$FF)
            MOVW    #$00, JEEP_Cnter        ; Counts sec in JEEP MODE
            MOVB    #$00, JEEP_LOOP         ; Initialize to MENU Mode (JEEP=$FF)
            MOVB    #$00, FAST_SET          ; Initialize FAST_SET to FALSE
            MOVB    #$00, LOC_TRACK         ; Initialize to AQUARIUM
            MOVB    #$00, EMERG_MODE        ; Initialize to OFF
            MOVB    #$00, EMERG_KEY         ; Initialize to 0
            MOVW    #$00, EMRG_Cnter        ; Counts sec in EMERGENCY MODE
            MOVB    #$00, EMRG_LOOP         ; Initialize to 0
            
            ;-------Dinasaurus Data---------;
            JSR     default_dino            ;
            MOVB    #$00, curr_dino         ; Current selected Dinosaurus
            MOVB    #$00, curr_food         ; Current selected Fish
            MOVB    #$00, target_food       ; Current selected Fish
            MOVB    #$00, curr_hunger       ; Current selected Fish
            ;                               ;
            MOVW    #$00, aqua_dino         ;
            MOVW    #aqua_1, aqua_dino+2    ;
            MOVW    #aqua_2, aqua_dino+4    ;
            MOVW    #aqua_3, aqua_dino+6    ;
            ;                               ;
            MOVW    #$00, garden_dino       ;
            MOVW    #veggie_1, garden_dino+2;
            MOVW    #veggie_2, garden_dino+4;
            MOVW    #veggie_3, garden_dino+6;
            ;                               ;
            MOVW    #$00, safari_dino       ;
            MOVW    #carniv_1, safari_dino+2;
            MOVW    #carniv_2, safari_dino+4;
            MOVW    #carniv_3, safari_dino+6;

            ;------CODE BEGINNING-----------;
            LBRA     Main_Logic
            NOP
            END