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
;inicio del programa:
START
MOVLW 0x07 ;Apagar comparadores
MOVWF CMCON
BCF STATUS, RP1 ;Cambiar al banco 1
BSF STATUS, RP0
MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
MOVWF TRISB
BCF STATUS, RP0 ;Regresar al banco 0
NOP

inicio:
bcf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 0
call tiempo ;llamar a la rutina de tiempo
nop ;NOPs de relleno (ajuste de tiempo)
nop
nop

 bsf PORTB,0 ;poner el puerto B0 (bit 0 del puerto B) en 1
call tiempo ;llamar a la rutina de tiempo
nop ;NOPs de relleno (ajuste de tiempo)

 goto inicio ;regresar y repetir
;rutina de tiempo
tiempo:
nop;1
movlw d'111' ;establecer valor de la variable k || cada uno vale 6--
movwf m
mloop:
    nop
    nop
    nop
    nop
    decfsz m,f
    goto mloop
     movlw d'28' ;establecer valor de la variable i || vale 22,218
    movwf i
iloop:
    nop;NOPs de relleno (ajuste de tiempo)
    nop
    nop
    nop
    nop;152
    movlw d'40' ;establecer valor de la variable j ||29,600
    movwf j
jloop:
    nop
    nop
    nop
    nop;NOPs de relleno (ajuste de tiempo)
    movlw d'50' ;establecer valor de la variable k ||27,816
    movwf k
kloop:
    decfsz k,f
    goto kloop
    decfsz j,f
    goto jloop
    decfsz i,f
    goto iloop
    return ;salir de la rutina de tiempo y regresar al
    ;valor de contador de programa
END


