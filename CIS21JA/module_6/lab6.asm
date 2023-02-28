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
; Question 1 (5pts) - DONE
; Add code in the blank below to print how many 0 bits there are in 
; the binary value of eax.
; The code must count the number of 0's such that the value of eax remains
; the same after code is done printing, but without using another register
; (or a memory variable!) to copy the data in eax.

; 1111111111101111 = -17
; 0000000000001010 = 10

COMMENT @
mov eax, -10			; change eax value to test your code
mov ebx, 0				; zeroing out ebx -- will load number of 0s here
mov ecx, 32				; load 32 into ecx for loop

countzero:
	ror eax, 1			; rotates to the right 1 bit
	jnc zero			; if carry bit is 0, jumps to zero function
	jc one				; if carry bit is 1, jumps to one function
	cmp ecx, 0
	jz print

zero:
	inc bl				; increments ebx if carry is zero
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
	movzx eax, bl
	call writeInt
	call crlf
	
	;call dumpRegs
@
	

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

mov eax, 64				; eax = val, change eax value to test your code	
;mov ebx, 0					; Clear out ebx, ebx will be true/false register
mov ecx, 32

zeroloop:
	ror eax, 1				; Rotates eax right by 1
	jnc iszero				; jump if zero
	jc isone				; jump if not zero
	jmp notPowerOf2			; jump to notPowerOf2

iszero:						;
	loop zeroloop


isone:
	jmp notZero

notZero:
	mov ebx, eax			; Copy eax into ebx
	dec ebx					; Decrement ebx (val - 1)
	and eax, ebx		; This might not work (eax - 1 DOES NOT WORK)
	not eax					; eax SHOULD equal 255
	mov ecx, 32				; move 32 into ecx
	jmp checkFFFF
	;mov ecx, 32				; load 32 into ecx as loop counter

checkFFFF:
	ror eax, 1
	jc checkOne
	jnc checkZero
	jmp powerOf2

checkOne:
	loop checkFFFF
	jmp powerOf2

checkZero:
	jmp notPowerOf2


powerOf2:
mov edx, OFFSET power2
jmp printing

notPowerOf2:
mov edx, OFFSET notPower2

printing:
call writeString
call crlf
;call writeInt


; Question 2b (2pts): explain in your own words how the formula above works

;	Passes true if non zero AND if val only has a single bit as 1 (If val is power of 2, !(val & (val - 1)) will always equal 11111111)


; Question 3 (4pts): Given the array aStr as defined in .data above, 
; and ebx is initialized below.
; Using ebx (not the aStr name), write ONE instruction in the blank below 
; to uppercase all the letters in str.

;	SUBTRACT 32 FROM EACH LETTER 

mov edx, OFFSET aStr


call writeString       ; should print: ABCD

	exit	
main ENDP

END main
