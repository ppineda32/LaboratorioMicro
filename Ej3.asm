.MODEL small
.STACK
.DATA
    numero1 DB ?
    numero2 DB ?
    mensaje DB 10,13,'Ingrese un numero',10,13,'$'
    mensajeProducto DB 10,13,'El producto es',10,13,'$'
    mensajeCociente DB 10,13,'El cociente es',10,13,'$'
    mensajeResiduo DB 10,13,'El residuo es',10,13,'$'
    residuo DB ?
    cociente DB ?
    producto DB ?
    
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
    
    ;multiplicacion con suma
    XOR CX, CX
    MOV CL, numero2
    SUB CL, 01h
    XOR AX,AX
    MOV AL, numero1
mult:
    ADD AL, numero1
    DEC CL
    JNZ mult
    MOV producto, AL

    XOR CX,CX
    XOR AX,AX
    MOV AL, numero1 

    ;dividir usando resta
dividir:
    INC CL
    SUB AL, numero2
    CMP AL,0
    JG dividir
    CMP AL,0
    JE valor
    DEC CL
valor:
    MOV cociente,CL
    MOV residuo,AL

    MOV DX, Offset mensajeProducto
    MOV AH, 09h
    INT 21h

    XOR DX,DX
    MOV DL, producto
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

    MOV DX, Offset mensajeCociente
    MOV AH, 09h
    INT 21h

    XOR DX,DX
    MOV DL, cociente
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

    MOV DX, Offset mensajeResiduo
    MOV AH, 09h
    INT 21h

    XOR DX,DX
    MOV DL, residuo
    ADD DL, 30h
    MOV AH, 02h
    INT 21h

finalizar:
    ;finalizar
    MOV AH, 4CH
    INT 21h
    
end programa