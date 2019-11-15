.386
.model flat, stdcall
option casemap:none
; Includes
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc
include \masm32\include\masm32rt.inc 
; librerias
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib
; Segmento de Datos
.DATA  
cadena DB 10,13,"Ingrese un numero",10,13,0
cadena2 DB 10,13,"La suma es",10,13,0

Input1 db 10 DUP(0)
numero DW 0,0
Resultado DW 0,0
; codigo
.CODE 
 
programa:
main PROC
	; imprimir cadena
	INVOKE StdOut, addr cadena
	INVOKE StdIn, addr Input1, 10

	LEA ESI, Input1
	XOR EBX, EBX
loop1:
	MOV BL, [ESI]
	SUB BL, 30h
	ADD numero,BX
	MOV CL, [ESI]
	CMP CL,0
	JNE loop2
	JE salir
loop2:
	XOR AX, AX
	MOV AX, numero
	MOV BX, 10
	MUL BX
	MOV numero,BX
	INC ESI
	JMP loop1
salir:

	XOR ECX,ECX
	MOV CX, numero
ciclo:
	XOR EAX, EAX
	MOV AX, Resultado
	MOV BX, numero
	MUL BX
	MOV Resultado, AX
	LOOP ciclo

	INVOKE StdOut, addr Resultado
	
	
	; finalizar
	INVOKE ExitProcess,0
	main ENDP
END programa
