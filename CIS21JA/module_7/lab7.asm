INCLUDE Irvine32.inc
; CIS21JA - Lab 7
; Name: Ryan Wang
; Part 1 

zeroFill MACRO time		; Adds a zero if value (assumes value is in eax) is less than 10
	LOCAL addZero
	LOCAL end
	push ecx
	;push ebx
	;mov eax, time
	mov ecx, 10
	cmp time, ecx
	js addZero
	call writeDec
	pop ecx
	jmp end				; May change later

	addZero:
		mov eax, 0
		call writeDec

		mov eax, time
		call writeDec

	end:
		
ENDM

.data
promptHr BYTE "Enter hour of get up time: ",0
promptMin BYTE "Enter minute of get up time: ",0
promptSnooze BYTE "Enter number of minutes of snooze: ",0
string1 BYTE "Alarm set for ",0
string2 BYTE " Hour and ",0
string3 BYTE " minute",0
colon BYTE ":",0
errorMsg BYTE "Invalid Input, Try Again.",0
timeArr SBYTE 2 DUP(?)


; STACK IS LIFO
; POP OPPOSITE OF PUSH ORDER


.code
main PROC

; Lab 7 Version
hour:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptHr 
	push OFFSET errorMsg
	push 23
	call readTime
	pop eax
	mov SDWORD PTR [timeArr], eax

min:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptMin
	push OFFSET errorMsg
	push 59
	call readTime
	pop eax
	mov DWORD PTR [timeArr + 1], eax

snooze:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptSnooze
	push OFFSET errorMsg
	push 59
	call readTime
	pop ebx						; snooze time in eax - may change later

printTime:
	
	;call calcTime

	mov ecx, DWORD PTR [timeArr]
	cmp ecx, 1
	js invalidHr

	mov edx, OFFSET string1		; Load in "Alarm set for"
	call writeString

	;mov eax, DWORD PTR [timeArr]
	mov ebx, 9
	zeroFill ebx
	
	mov edx, OFFSET colon		; load in ":"
	call writeString

	;mov eax, DWORD PTR [timeArr + 1]
	mov ebx, 9
	zeroFill ebx

	call crlf
	jmp hour

	invalidHr:
		mov edx, OFFSET errorMsg
		call writeString

	jmp hour
main ENDP

; Stack stuff:
;	- push []


readTime PROC
	basePointer:
		push ebp		; save current ebp
		mov ebp, esp	; save esp into ebp now so we can do shit with it if we want i guess
		push edx		; save whatever was already in edx (might be unnecessary)

	writeFunc:
		mov edx, [ebp + 16] ; Moves [ebp + 20] into edx (SHOULD be promptHr)
		call writeString
		call readInt
		;push eax			; Push user input into stack
		cmp eax, [ebp + 8]  ; compares eax (user inputted hour) with [ebp + 12] (SHOULD be max hr)
		jg error			; If error, jump to error block

		; if not error do following:
		mov [ebp + 16], eax	; Moves user input (eax) into [ebp + 20] (top of stack)
		pop edx				; Pop edx back
		pop ebp				; pops out bottom (ebp) back into ebp
		ret 16				; pops out eip and next 3 stack elements (16 bytes)

	error:
		mov edx, OFFSET errorMsg	; move error to edx
		call writeString
		call CrLf
		jmp writeFunc

readTime ENDP
	
; TODO - FIX THIS SHIT
calcTime PROC
	; SnoozeTime in ebx, hr and min in timeArr
	; TODO - Load the array times into minutes, subtract snooze time
	; If calculated wakeup time is not valid, replace hour with -1
	mov eax, 0
	mov al, timeArr				; Move hour into al
	cmp al, 1
	jg invalidHr
	jmp restOfFunc
	invalidHr:
		mov timeArr, -1
		jmp calcMin
	
	restOfFunc:
		mov bl, 60
		mul bl
		add ax, WORD PTR [timeArr + 1]			; Adds Hrs and minutes

		;movzx ecx, cx

		sub ax, bx					; Subtracts SnoozeTime from total time
		mov dx, 0					; Zeroing out DX for 16 bit division
		mov cx, 60					; Divisor is CX (60)
		div cx
		mov WORD PTR [timeArr], ax			; Move hours to timeArr[0]
		mov WORD PTR [timeArr + 1], dx		; Move minutes to timeArr[1]

	calcMin:
		ret

calcTime ENDP

	exit
END main

