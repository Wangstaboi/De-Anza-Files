INCLUDE Irvine32.inc

; Part 1 

zeroFill MACRO			; Adds a zero if value is less than 10
	cmp eax, 10
	jg addZero
	call writeDec
	jmp end				; May change later

	addZero:
		push eax		; save eax into stack
		mov eax, 0		; Moves zero into eax
		call writeDec
		pop eax
		call writeDec

	end:
		call crlf
		
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
timeArr BYTE 2 DUP(?)


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
	pop [timeArr]						

min:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptMin
	push OFFSET errorMsg
	push 59
	call readTime
	pop [timeArr + 1]

snooze:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptSnooze
	push OFFSET errorMsg
	push 59
	call readTime
	pop ebx						; snooze time in eax - may change later

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
	
calcTime PROC
	; SnoozeTime in ebx, hr and min in timeArr


calcTime ENDP

	exit
END main











