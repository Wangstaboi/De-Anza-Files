INCLUDE Irvine32.inc

; Part 1 
.data
promptHr BYTE "Enter hour of get up time: ",0
promptMin BYTE "Enter minute of get up time: ",0
promptSnooze BYTE "Enter number of minutes of snooze: ",0
string1 BYTE "Alarm set for ",0
string2 BYTE " Hour and ",0
string3 BYTE " minute",0
colon BYTE ":",0
errorMsg BYTE "Invalid Input, Try Again.",0
timeArr BYTE, 2 DUP(?)


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

min:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptHr
	push OFFSET errorMsg
	push 59
	call readTime

snooze:
	sub esp, 4					; saves room for return value (return value -- esp)
	push OFFSET promptSnooze
	push OFFSET errorMsg
	push 59
	call readTime

main ENDP

; Stack stuff:
;	- push []


PROC readTime
	basePointer:
		push ebp		; save current ebp
		mov ebp, esp	; save esp into ebp now so we can do shit with it if we want i guess
		;push edx		; save whatever was already in edx (might be unnecessary)

	writeFunc:
		mov edx, [ebp + 16] ; Moves [ebp + 20] into edx (SHOULD be promptHr)
		call writeString
		call readInt
		;push eax			; Push user input into stack
		cmp eax, [ebp + 8]  ; compares eax (user inputted hour) with [ebp + 12] (SHOULD be max hr)
		jg error			; If error, jump to error block

		; if not error do following:
		mov [ebp + 20], eax	; Moves user input (eax) into [ebp + 20] (top of stack)
		pop ebp				; pops out bottom (ebp) back into ebp
		ret 16				; pops out eip and next 3 stack elements (16 bytes)


		;push eax			; Moves current eax value (SHOULD be current hr)

	error:
		mov edx, OFFSET errorMsg	; move error to edx
		call writeString
		call CrLf
		jmp writeFunc

readTime ENDP

END main











