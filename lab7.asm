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
cadena3 DB 10,13,"La resta es",10,13,0
numero1 DW 0,0
numero2 DW 0,0
temp DW 0,0


Input1 db 10 DUP(0)
Input2 db 10 DUP(0)
; codigo
.CODE 
 
programa:
main PROC
	; imprimir cadena
	INVOKE StdOut, addr cadena
      invoke StdIn, addr Input1, 10
      invoke StdOut, addr cadena
      invoke StdIn, addr Input2, 10

      invoke StripLF, addr Input1
      invoke StripLF, addr Input2

      invoke atodw, addr Input1
      mov numero1, ax

      invoke atodw, addr Input2
      mov numero2, ax



      mov ax, numero1
      add ax, numero2
      mov temp, ax

      invoke StdOut, addr cadena2      
      ADD temp, 30h
      INVOKE StdOut, addr temp


	
	
	; finalizar
	INVOKE ExitProcess,0
	main ENDP
END programa
