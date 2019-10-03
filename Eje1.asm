.MODEL small
.STACK
.DATA
    numero1 db 5d
    numero2 db 1d
    cociente db ?
    residuo db ?
    cadena1 DB 'El resultado de la suma es',10,13,'$'
    cadena2 DB 10,13,'La diferencia es',10,13,'$'
    cadena3 DB 10,13,'El producto es',10,13,'$'
    cadena4 DB 10,13,'El cociente es',10,13,'$'
    cadena5 DB 10,13,'El residuo es',10,13,'$'

.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX

    
    ;Imprimir cadena
    MOV DX, OFFSET cadena1   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ;Suma de numeros
    XOR DX,DX
    MOV DL, numero1
    ADD DL, numero2
    ADD DL, 30h
    ;Impresion de numero
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira


    ;Imprimir cadena
    MOV DX, OFFSET cadena2   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ;Differencia de numeros
    XOR DX,DX
    MOV DL, numero1
    SUB DL, numero2
    ADD DL, 30h
    ;Impresion de numero
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira


    ;Imprimir cadena
    MOV DX, OFFSET cadena3   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ;Producto de numeros
    XOR DX,DX
    MOV AL, numero1
    MUL numero2
    MOV DX,AX
    ADD DL, 30h
    ;Impresion de numero
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira


    ;Imprimir cadena
    MOV DX, OFFSET cadena4   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ;Division de numeros
    XOR AX, AX          ; limpiar los registros
    MOV AL, numero1
    DIV numero2
    ; Guardar los valores en variables antes de imprimir
    MOV cociente, al 
    MOV residuo, ah
    ; Agregar 30h para mostrar el numero real
    ADD cociente, 30h
    ADD residuo, 30h
    ; Imprimir 
    XOR AX, AX
    MOV AH, 02h
    MOV DL, cociente
    INT 21h
    MOV DX, OFFSET cadena5   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    ; imprimir residuo
    XOR AX, AX
    MOV AH, 02h
    MOV DL, residuo
    INT 21h
    


    ; finalizar programa
    MOV AH, 4CH
    INT 21h


END programa