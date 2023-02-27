TITLE  Assignment 6: Bit-wise instructions

;;; lab requirement: use bitwise instructions when possible to make the code shorter
		
; Name:  

INCLUDE Irvine32.inc

VAL = 129

.data
num0 BYTE "Number of zeros: ", 0				; use for output of question 1
power2 BYTE "Power of 2", 0ah, 0dh, 0			; use for output of question 2
notPower2 BYTE "Not power of 2", 0ah, 0dh, 0	; use for output of question 2
aStr BYTE "abcd",0


.code
main PROC
; Question 1 (5pts)
; Add code in the blank below to print how many 0 bits there are in 
; the binary value of eax.
; The code must count the number of 0's such that the value of eax remains
; the same after code is done printing, but without using another register
; (or a memory variable!) to copy the data in eax.

; 1111111111101111 = -17
; 0000000000001010 = 10
mov eax, 10			; change eax value to test your code
mov ebx, 0				; zeroing out ebx -- will load number of 0s here
mov ecx, 32				; load 32 into ecx for loop

countzero:
	ror eax, 1			; rotates to the right 1 bit
	jnc zero			; if carry bit is 0, jumps to zero function
	jc one				; if carry bit is 1, jumps to one function
	cmp ecx, 0
	jz print
	;loop countzero		; loops 32 times
zero:
	inc ebx				; increments ebx if carry is zero
	loop countzero
	cmp ecx, 0
	jz print
one:
	loop countzero
	cmp ecx, 0
	jz print
print:
	mov edx, OFFSET num0
	call writeString
	;call crlf
	call writeInt
	call crlf
	call dumpRegs

	;mov eax, ebx
	;call writeDec

; Question 2a (5pts)
; Add code in the blank below to determine if a data value is a power of 2, 
; using the formula:
;    bool powerOf2 = val && !(val & (val - 1)) 
; where & is a bitwise AND, && is a logical AND, ! is a logical NOT
; Note: 
; - there is a difference between bitwise AND vs logical AND, don't mix them up.
; - there is also a difference between with bitwise NOT and logical NOT.
; You *cannot* use the CMP instruction in your code (try a bitwise instruction)
; Use power2 and notPower2 for your text output.

mov eax, 129				; eax = val, change eax value to test your code	





powerOf2:
mov edx, OFFSET power2
jmp printing

notPowerOf2:
mov edx, OFFSET notPower2
printing:
call writeString
call crlf


; Question 2b (2pts): explain in your own words how the formula above works



; Question 3 (4pts): Given the array aStr as defined in .data above, 
; and ebx is initialized below.
; Using ebx (not the aStr name), write ONE instruction in the blank below 
; to uppercase all the letters in str.

mov edx, OFFSET aStr

call writeString       ; should print: ABCD

	exit	
main ENDP

END main
