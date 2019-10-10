.MODEL small
.STACK
.DATA
    num DB ?
    mensaje DB 'Ingrese un numero',10,13,'$'
    espar DB 10,13,'El numero es par$'
    noespar DB 10,13,'El numero es impar$'
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
    MOV num, AL
    SUB num, 30h
    
    ;Dividir entre 2
    XOR AX, AX
    MOV AL, num
    MOV CL,2
    DIV CL
    ;residuo en ah
    MOV residuo, AH
    
    ;Comparar si es par
    CMP residuo,0
    JZ imprimirespar
    JNZ finalizar
    
imprimirespar:
    MOV DX, Offset espar
    MOV AH, 09h
    INT 21h
    
finalizar:
    MOV DX, Offset noespar
    MOV AH, 09h
    INT 21h
    ;finalizar
    MOV AH, 4CH
    INT 21h
    
end programa