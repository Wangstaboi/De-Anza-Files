TITLE Module 6 Exercise						

INCLUDE Irvine32.inc

.data
bigData QWORD 123456781234567h

.code
main PROC

;;;;;;;;;;;;  part 1: bit-wise instructions ;;;;;;;;;;;;;
; predict what the code will do by answering
; the questions, then step through the code
; to check your answers

	mov al, 1010b
	and al, 1      ; al:
	or al, 1       ; al:
	xor al, 0fh    ; al:
	not al         ; al:

	mov al, 1010b
	test al, 1000b   ; what are we testing for?
	jz L1			 ; will it jump?
	mov bl, 1
L1:
	xor al, al		 ; al:

nextTest:
	mov al,1000b
	test al, 80h	; what are we testing for?
	jnz L2			; will it jump?
	not al			; al:
L2:



	mov al,2
	shl al,1		; al:
	sal al,2		; al:

	shr al,1		; al: 


	mov al,0feh		
	shr al,1		; al:
	mov al,0feh    
	sar al,1		; al:


	mov al, 0fh
	ror al,4		; al:
	rol al,4		; al:

	mov al, 0f0h
	stc				; set cf
	rcr al, 4		; al:
	mov al, 0f0h
	clc				; clear cf
	rcl al, 4;		; al:

	mov ax,1234h	
	mov bx,5678h
	shld ax,bx,4	; ax:    bx:
	shrd bx,ax,4	; ax:    bx:

	;;;;;;;;;;;;;;; part 2: solve these problems ;;;;;;;;;;;;

;Problem 1:
mov ax, 1234h
mov bx, 100h
mul bx				; result:

; call writeDec to print the result






;Problem 2:
; multiply bigData by 2, then store the result back in bigData




;Problem 3 - indirect addressing:
; multiply bigData by 2, then store the result back in bigData,
; but we only have the address of bigData in ebx

mov ebx, OFFSET bigData




	exit
main ENDP

END main