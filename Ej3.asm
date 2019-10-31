.MODEL small
.DATA
    cadena1 DB 80 dup(?)
    mensaje1 DB 10,13,'Ingrese palabra',10,13,'$'
    mensaje2 DB 10,13,'Es palindromo',10,13,'$'
    mensaje3 DB 10,13,'No es palidromo',10,13,'$'

    cadena1_lenght DW 0
.STACK
.CODE

Programa: ;etiqueta de inicio de probrama

    ;inicializar el programa
    MOV AX, @DATA   ;guardando direccion de inicio segmento de datos
    MOV DS, AX      ;tiene tamaño diferente y lo mueve automaticamente

;Imprimir cadena
    MOV DX, OFFSET mensaje1   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    
    XOR SI, SI
    LEA SI, cadena1
    CAll LeerCadena
    MOV cadena1_lenght, SI

    LEA SI, cadena1
    LEA DI, cadena1
    ADD DI, cadena1_lenght
    DEC DI
comparar1:
    MOV AX, [DI]
    MOV BX, [SI]
    CMP BL, AL
    JNE nopalindromo
    INC SI
    DEC DI
    CMP SI, cadena1_lenght
    JNE comparar1

palidromo:
    ;Imprimir cadena
    MOV DX, OFFSET mensaje2   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    JMP Finalizar
nopalindromo:
    ;Imprimir cadena
    MOV DX, OFFSET mensaje3   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    JMP Finalizar

PROC LeerCadena
    MOV CX, SI
LlenarCadena:
    MOV AH, 01h
    INT 21h
    CMP AL, 0Dh
    JE TerminarCadena
    MOV [SI], AL
    INC SI
    JMP LlenarCadena

TerminarCadena:
    MOV [SI], 24h
    MOV AX, SI
    SUB AX, CX
    RET
ENDP LeerCadena


Finalizar:
    ;FINALIZAR PROGRAMA
    MOV AH, 4Ch     ;finalizar el proceso
    INT 21h         ;ejecuta la interrupcion
End Programa