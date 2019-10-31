.MODEL small
.DATA
    cadena DB 80 dup(?)
    cadena1 DB 'Ingrese Cadena',10,13,'$'
    cadena2 DB 10,13,'Cadena convertida',10,13,'$'
.STACK
.CODE

Programa: ;etiqueta de inicio de probrama

    ;inicializar el programa
    MOV AX, @DATA   ;guardando direccion de inicio segmento de datos
    MOV DS, AX      ;tiene tamaño diferente y lo mueve automaticamente

;Imprimir cadena
    MOV DX, OFFSET cadena1   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    XOR SI, SI
    LEA SI, cadena
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

;Imprimir cadena
    MOV DX, OFFSET cadena2   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

Convertir:
    DEC SI
    MOV AL, [SI]
    SUB AL, 20h
    MOV [SI], AL
    Loop Convertir

    ;Imprimir cadena
    MOV DX, OFFSET cadena   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

Finalizar:
    ;FINALIZAR PROGRAMA
    MOV AH, 4Ch     ;finalizar el proceso
    INT 21h         ;ejecuta la interrupcion
End Programa