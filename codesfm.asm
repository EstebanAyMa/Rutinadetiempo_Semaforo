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
j equ 0x31 ;pasar direccion i y luego 
k equ 0x32
m equ 0x33
w equ 0x34
x equ 0x35
y equ 0x36
z equ 0x37
 
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
CALL LONG_TIME
nop
nop
    
MOVLW b'00100010'
MOVWF PORTB
CALL SHORT_TIME
nop
nop
    
MOVLW b'00001100'
MOVWF PORTB
CALL LONG_TIME
nop
nop
    
MOVLW b'00010100'
MOVWF PORTB
CALL SHORT_TIME
    
GOTO inicio
 
    
    

LONG_TIME:
nop
nop
movlw d'198' ;establecer valor de la variable k 
movwf m
mloop:
nop
nop
nop
decfsz m,f
goto mloop
movlw d'80' ;establecer valor de la variable i
movwf i
iloop:
nop ;NOPs de relleno (ajuste de tiempo)
nop
nop
movlw d'117' ;establecer valor de la variable j
movwf j
jloop:
nop
nop
nop
nop
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'105' ;establecer valor de la variable k
movwf k
kloop:
nop
nop
decfsz k,f
goto kloop
decfsz j,f
goto jloop
decfsz i,f
goto iloop
RETURN    
    
    
SHORT_TIME:
nop
nop
nop
nop
nop
movlw d'16' ;establecer valor de la variable k 
movwf w
wloop:
nop
nop
nop
nop
decfsz w,f
goto wloop
movlw d'59' ;establecer valor de la variable i
movwf x
xloop:
nop ;NOPs de relleno (ajuste de tiempo)
nop
nop
movlw d'70' ;establecer valor de la variable j
movwf y
yloop:
nop
nop
nop
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'78' ;establecer valor de la variable k
movwf z
zloop:
decfsz z,f
goto zloop
decfsz y,f
goto yloop
decfsz x,f
goto xloop
RETURN
    

   ;salir de la rutina de tiempo y regresar al
;valor de contador de programa
END