.MODEL small
.DATA
;variable que contiene el texto que queremos mostrar
variable1 DB 'Pablo Pineda',10,13,'$' ; $ Significa el final de la cadena
variable2 DB '2048917',10,13,'$' ; $ Significa el final de la cadena

.STACK

.CODE

programa: ;etiqueta de inicio de probrama


    ;inicializar el programa
    mov ax, @DATA   ;guardando direccion de inicio segmento de datos
    mov ds, ax      ;tiene tamaño diferente y lo mueve automaticamente

    ;Asignacion
    ;mov Destino, Origen

    ;Imprimir cadena
    mov dx, OFFSET variable1   ;asignando a dx la variable cadena
    mov ah, 09h     ;decimos que se imprimira una cadena
    int 21h  
    xor dx, dx

    ;Imprimir cadena
    mov dx, OFFSET variable2   ;asignando a dx la variable cadena
    mov ah, 09h     ;decimos que se imprimira una cadena
    int 21h   
    xor dx, dx      

    ;Imprimir caracter
    mov dx,    ;asignando a dx la variable cadena
    mov ah, 09h     ;decimos que se imprimira una cadena
    int 21h   
    xor dx, dx      

    ;FINALIZAR PROGRAMA
    mov ah, 4Ch     ;finalizar el proceso
    int 21h         ;ejecuta la interrupcion
end programa