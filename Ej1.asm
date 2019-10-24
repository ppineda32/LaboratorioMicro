.MODEL small
.DATA
;variable que contiene el texto que queremos mostrar
cadena DB 10,13,'Ingrese 2 digitos',10,13,'$' ; $ Significa el final de la cadena
numero1 DB 0
numero2 DB 0

.STACK

.CODE

Programa: ;etiqueta de inicio de probrama

    ;inicializar el programa
    MOV AX, @DATA   ;guardando direccion de inicio segmento de datos
    MOV DS, AX      ;tiene tamaño diferente y lo mueve automaticamente

    ;Imprimir cadena
    MOV DX, OFFSET cadena   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    XOR AH, AH
    MOV BL, 0Ah
    MUL BL
    MOV numero1,AL

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    ADD numero1,AL

    ;Imprimir cadena
    MOV DX, OFFSET cadena   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    XOR AH, AH
    MOV BL, 0Ah
    MUL BL
    MOV numero2,AL

    ;Leer num
    XOR AX, AX      ;limpiamos AX
    MOV AH, 01h     ;leer 1 caracter
    INT 21h
    SUB AL, 30h     ;quitar 30h AL caracter
    ADD numero2,AL

    XOR CX, CX
    MOV CL, numero1
    DEC CL
    MOV AL, numero2
Ciclo1:
    ADD AL, numero2
    Loop Ciclo1
    MOV numero2,AL

    MOV DL, 10d
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    MOV DL, 13d
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    XOR AX,AX
    MOV AL,numero2
    ;Impresion de numero
    MOV BL, 0Ah
    DIV BL
    MOV DL, AL
    MOV CL, AH
    ADD DL, 30h
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ADD CL, 30h
    XOR DX, DX
    MOV DL, CL
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    ;FINALIZAR PROGRAMA
    MOV AH, 4Ch     ;finalizar el proceso
    INT 21h         ;ejecuta la interrupcion
End Programa