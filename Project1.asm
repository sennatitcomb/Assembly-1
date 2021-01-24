TITLE Project1 Program(template.asm)

; Author: Senna Titcomb
; Last Modified : 1 / 15 / 2021
; OSU email address : titcombs@oregonstate.edu
; Course number / section: 271 / 001
; Assignment Number : Program 1                Due Date : Jan 17
; Description: Write a MASM program that can display Nameand Program
; Title, user instructions, allow user to input 2 numbers, calculate sum,
; difference product, quotient, remainder, and display terminating message
; EC: PROGRAM VERIFIES SECOND NUMBER IS LESS THAN FIRST
; EC: PROGRAM FINDS SQUARE OF EACH NUMBER

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
; (insert variable definitions here)
	titlemessage BYTE "Elementary Arithmetic by Senna Titcomb", 0dh, 0ah, 0
	descriptionmessage BYTE "Please enter 2 numbers and I will print out the sum, difference, product, quotient, and remainder.", 0dh, 0ah, 0
	terminatemessage BYTE "Thank you! Bye!", 0dh, 0ah, 0
	firstmess BYTE "First Number: ", 0
	secondmess BYTE "Second Number: ", 0
	plussign BYTE " + ", 0
	minus BYTE " - ", 0
	multsign BYTE " * ", 0
	divsign BYTE " / ", 0
	equalsign BYTE " = ", 0
	rem BYTE " remainder ", 0
	errormess BYTE "Error: The second number is greater than/equal to than the first number.", 0
	lessthan BYTE "The second number is less than the first number." , 0
	square BYTE "The square of ", 0
	ismess BYTE " is ", 0
	num1 SDWORD ?
	num2 SDWORD ?
	result DWORD 0
	remainder DWORD 0



.code
main PROC
	call Clrscr

; print titlemessage
	mov edx, OFFSET titlemessage
	call WriteString

; print descriptionmessage
	mov edx, OFFSET descriptionmessage
	call WriteString
	call Crlf

; print first message
	mov edx, OFFSET firstmess
	call WriteString
	call ReadInt
	mov num1, eax

; print second message
	mov edx, OFFSET secondmess
	call WriteString
	call ReadInt
	mov num2, eax
	call Crlf

; is num2 less than num1?
	mov eax, num2	;moves num2 to eax
	cmp eax, num1	;compares num2 to num1
	jl  L1		;less than jump L1
	mov edx, OFFSET errormess	;output message Error
	call WriteString
	jge L2	;greater than jump L2
	
	
	L1:
		mov edx, OFFSET lessthan	;output message less than
		call WriteString
		call Crlf


; print sum
	mov eax, num1	;moves number1 to eax
	call WriteDec
	mov edx, OFFSET plussign	;addition
	call WriteString
	add eax, num2	;adds number2 to the existing number1 in eax
	mov result, eax
	mov eax, num2
	call WriteDec
	mov edx, OFFSET equalsign ;equals sign
	call WriteString
	mov eax, result
	call WriteDec	;prints result
	call Crlf

; print diff
	mov eax, num1	;puts num1 into eax
	call WriteDec
	sub eax, num2	;subtracts num2 from the existing num1 in eax
	mov result, eax
	mov edx, OFFSET minus
	call WriteString
	mov eax, num2
	call WriteDec
	mov eax, result
	mov edx, OFFSET equalsign
	call WriteString
	call WriteDec	;prints result
	call Crlf

; print product
	mov eax, num1	 ;puts num1 in eax
	call WriteDec
	mov ebx, num2	;puts num2 in ebx
	mul ebx			;multiplies eax by ebx
	mov result, eax		;takes in result from eax
	mov edx, OFFSET multsign
	call WriteString
	mov eax, num2
	call WriteDec
	mov eax, result
	mov edx, OFFSET equalsign
	call WriteString
	call WriteDec		;prints out result
	call Crlf

; print quotient
	mov eax, num1	;puts num1 in eax
	call WriteDec
	cdq
	mov ebx, num2	;puts num2 in ebx
	div ebx			;divides num2 by num1
	mov result, eax
	mov remainder, edx
	mov edx, OFFSET divsign
	call WriteString
	mov eax, num2
	call WriteDec
	mov eax, result
	mov edx, OFFSET equalsign
	call WriteString
	call WriteDec	;prints out result

; print remainder
	mov edx, OFFSET rem
	call WriteString
	mov eax, remainder
	call WriteDec
	call Crlf

		
; finds square of each number
	mov edx, OFFSET square
	call WriteString
	mov eax, num1		;puts num1 in eax
	call WriteDec
	mov ebx, num1		;puts num1 in ebx
	mul ebx			;multiplies num1 by itself
	mov result, eax
	mov edx, OFFSET ismess
	call WriteString
	call WriteDec	;prints out result
	call Crlf

	mov edx, OFFSET square
	call WriteString
	mov eax, num2		;puts num2 in eax
	call WriteDec
	mov ebx, num2		;puts num2 in ebx
	mul ebx			;multiplies num2 by itself
	mov result, eax
	mov edx, OFFSET ismess
	call WriteString
	call WriteDec		;prints out result
	call Crlf

L2:
	call Crlf

;print goodbye
	mov edx, OFFSET terminatemessage
	call WriteString


; (insert executable instructions here)

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
