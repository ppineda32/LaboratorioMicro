.MODEL small
.STACK
.DATA
    numero1 DB ?
    numero2 DB ?
    mensaje DB 10,13,'Ingrese un numero',10,13,'$'
    esigual DB 10,13,'Los dos numeros son iguales$'
    esmayor DB 10,13,'El primero es mayor que el segundo$'
    esmenor DB 10,13,'El Segundo es mayor que el primero$'
    residuo DB ?
    
.CODE
programa:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, Offset mensaje
    MOV AH, 09h
    INT 21h
    
    ;Leer num
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV numero1, AL
    SUB numero1, 30h
    
    MOV DX, Offset mensaje
    MOV AH, 09h
    INT 21h
    
    ;Leer num
    XOR AX, AX
    MOV AH, 01h
    INT 21h
    MOV numero2, AL
    SUB numero2, 30h
    
    ; Comparar numeros
    MOV AL, numero1
    CMP AL, numero2
    JE iguales
    JG primeroMayorSegundo
    JL segundoMayorPrimero
    
iguales:
    MOV DX, Offset esigual
    MOV AH, 09h
    INT 21h
primeroMayorSegundo:
    MOV DX, Offset esmayor
    MOV AH, 09h
    INT 21h
    JMP finalizar
segundoMayorPrimero:
    MOV DX, Offset esmenor
    MOV AH, 09h
    INT 21h
    JMP finalizar
finalizar:
    ;finalizar
    MOV AH, 4CH
    INT 21h
    
end programa