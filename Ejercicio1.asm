.MODEL small
.STACK
.DATA
    numero1 db 5d
    numero2 db 4d
    cadena1 DB 'El resultado de la suma es',10,13,'$'
    cadena2 DB 10h,13h,'La diferencia es$'
    cadena3 DB 10h,13h,'El producto es$'
    cadena4 DB 10h,13h,'El cociente es$'
    cadena5 DB 10h,13h,'El residuo es$'

.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX

    ;Imprimir cadena
    MOV DX, OFFSET cadena1   ;asignando a DX la variable cadena
    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira

    XOR DX,DX
    MOV DL, numero1
    ADD DL, numero2
    ADD DL, 30h


    MOV AH, 09h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira



    ; finalizar programa
    MOV AH, 4CH
    INT 21h


END programa