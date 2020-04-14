; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF Entry, DelayCount
            XREF __SEG_END_SSTACK, Delay     

; variable/data section
MY_EXTENDED_RAM:    SECTION
                ORG   $800
STEP_SEQ:       dc.b  $0A, $12, $14, $0C
STEP_Size:      dc.w  $03
SCAN_Seq:       dc.b  $70, $B0, $D0, $E0
Scan_Count:     ds.w  $01
DelayCount:     dc.w  1000
TAB:            dc.b  $eb, $77, $7b, $7d, $b7, $bb, $bd, $d7, $db, $dd, $e7, $ed, $7e, $be, $de, $ee
key_press:      ds.b  1
key_val:        ds.b  1

MY_CONSTANT_ROM: SECTION

; Port u / Keypad Initialization
port_u:         equ  $268
ddr_u:          equ  $26A
psr_u:          equ  $26D
peru_u:         equ  $26C

; Code section
MyCode:             SECTION
Entry:
            LDS     #__SEG_END_SSTACK       ; Initialize stack
            ; Interrupts Setup
            MOVB    #$80, CRGINT            ; Enable RTI
            MOVB    #$40, RTICLR            ; Set RTI to 1 ms
        
            ; Keyboard Setup
            BSET    ddr_u, #$F0             ; port u (keyboard) / DDR, set as input
            BSET    peru_u, #$0F            ; port u (keyboard) / PER, Set as pull-up/down
            BSET    psr_u, #$F0             ; port u (keyboard) / PDR, set as pull-up
            MOVW    #$00, Scan_Count        ; initialize the counter
            CLI                             ; Initialize Interrupts

;--------------------------------
;           INTERRUPTS
;--------------------------------

RTI_ISR:    LDX     Counter             ; Load counter to Idx X
            INX                         ; Increment Counter
            STX     Counter             ; Store Counter
            CPX     #1000               ; Has the counter reached value?
            BNE     END_RTI             ; If not, exit RTI
            MOVW    #0, Counter         ; Else, Initialize counter to 0
            INC     time                ; Increase time
            BRCLR   time, $0A, END_RTI  ; If time reach #10
            BCLR    time, $0F           ;    clear unit of time
            LDAA    time                ;    and add #10
            ADDA    #$10                ;    the store back to time
            STAA    time                ;   
            CMPA    #$60                ; If time reach #60
            BNE     END_RTI             ;
            CLR     time                ; Clr time

END_RTI:    BCLR    CRGFLG, #$80        ;
            RTI

;--------------------------------
;    KEYBOARD IMPLEMENTATION
;--------------------------------
Set_seq:    LDX     Scan_Count          ; Load Scan_Count 
            LDAA    SCAN_Seq, X         ; Load keyboard sequence
            STAA    port_u              ; Write to Keyboard
            INX                         ;     (Read will happen in 
            CPX     $04                 ;       next interrupts)
            BNE     Exit_set            ; If Scan_Count not maxed, skip
            LDX     #$00                ; If Scan_Count maxed, reset
Exit_set:   STX     Scan_Count          ; Store Scan_Count
            RTS

Scan_seq:   BRCLR   port_u, $0F, Key_Tab; If Key is pressed, go to Key_tab
            RTS

Key_Tab:    LDX     #$0                 ; Start Idx X to zero
Key_Loop:   LDAA    TAB,x               ; Load key value and    
            CMPA    port_u              ;  compare to port_u 
            BEQ     Exit_key            ; If match move to exit
            INX                         ; If no match, inc X
            CPX     #$10                ; If x is not saturated
            BNE     Key_Loop            ;    Loop back
            LDAA    #$FF                ; If no match, key_val=$FF
Exit_key:   STAA    key_val             ; Otherwise, store key in key_val
            RTS
