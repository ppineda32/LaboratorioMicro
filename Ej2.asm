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

main:
    mov ah , 0Bh    ; comprobar si existe input
    int 21h
    cmp al , 00h    ; comparar si no hay nada de input
    JNE leer
    
    MOV DL, 58h
    MOV AH, 02h     ;decimos que se imprimira una cadena
    INT 21h         ;ejecuta la interrupcion, imprimira
    JMP main

Leer:
    MOV AH, 07h    ; leer tecla
    INT 21h
    CMP AL, 13d     ;es enter?
    JE Salir
    JMP main

Salir:
    ;FINALIZAR PROGRAMA
    MOV AH, 4Ch     ;finalizar el proceso
    INT 21h         ;ejecuta la interrupcion
End Programa