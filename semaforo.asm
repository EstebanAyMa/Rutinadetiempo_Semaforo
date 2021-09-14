#include "p16F628a.inc" ;incluir librerias relacionadas con el dispositivo
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)
RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program
;variables para el contador:
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33
o equ 0x34
p equ 0x35
q equ 0x36
r equ 0x37
;inicio del programa:
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB
BCF STATUS, RP0 ;Regresar al banco 0

inicio:
    MOVLW b'00100001'
    MOVWF PORTB
    call time_lar
    MOVLW b'00100010'
    MOVWF PORTB
    call time_sho
    MOVLW b'00001100'
    MOVWF PORTB
    nop
    nop
    call time_lar
    MOVLW b'00010100'
    MOVWF PORTB
    call time_sho
    goto inicio 

 
 
 
 
 
 
time_lar:
nop;1
    nop
    nop
movlw d'7' ;establecer valor de la variable k || cada uno vale 6--
movwf m
mloop:
    nop
    nop
    nop
    decfsz m,f
    goto mloop
    movlw d'69' ;establecer valor de la variable i || vale 22,218   36088
    movwf i
iloop:
    ;NOPs de relleno (ajuste de tiempo)    
    ;152
    movlw d'97' ;establecer valor de la variable j ||29,600
    movwf j
jloop:
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop;NOPs de relleno (ajuste de tiempo)
    movlw d'105' ;establecer valor de la variable k ||27,816
    movwf k
kloop:
    nop
    nop
    nop
    nop
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return 
    
    
    
    
    
    
time_sho:
nop
nop
movlw d'151' ;establecer valor de la variable k || cada uno vale 2--
movwf o
oloop:
    decfsz o,f
    goto oloop
    movlw d'43' ;establecer valor de la variable i || vale 36088
    movwf p
ploop:
    nop;27
    ;NOPs de relleno (ajuste de tiempo)    
    ;152
    movlw d'70' ;establecer valor de la variable j ||  15714
    movwf q
qloop:
   
    movlw d'82' ;establecer valor de la variable k ||27,816
    movwf r
rloop:
    nop
    decfsz r,f
    goto rloop
    decfsz q,f
    goto qloop
    decfsz p,f
    goto ploop
    return 
    
END
    