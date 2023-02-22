INCLUDE Irvine32.inc

; Part 1 
.data
string BYTE "quiz",0
promptHr BYTE "Enter hour of get up time: ",0
promptMin BYTE "Enter minute of get up time: ",0
promptSnooze BYTE "Enter number of minutes of snooze: ",0
string1 BYTE "Alarm set for ",0
string2 BYTE " Hour and ",0
string3 BYTE " minute",0
error BYTE " Invalid Input. Try Again.",0

.code
main PROC
jmp Start
Start:
	mov edx, OFFSET promptHr	; moves promptHR into edx
	call writeString		; Writes out "Enter hour of get up time"
	call readDec			; Takes user input for hour of get up time, stores in eax
	jmp Hour
	
	; Add Loop

Hour:
	cmp eax, 23
	ja Error
	mov ebx, eax
	mov eax, 0
	cmp ebx, eax
	jl Error

Error: 
	mov edx, OFFSET error
	call writeString
	jmp Start

mov bl, al				; Moves hour to bl

mov edx, OFFSET promptMin	; moves promptMin into edx
call writeString		; Writes out promptMin to console
call readDec			; Takes user input (should be for min), stores in eax

; Add Loop


mov cl, al				; Moves minutes to cl

mov edx, OFFSET promptSnooze	; moves promptSnooze into edx
call writeString		; Writes out promptSnooze to console
call readDec			; Takes user input (for snooze time in min) stores in eax

; Add Loop

mov dl, al

; hour = bl, min = cl, snooze = dl
; Checkpoint - Everything until here is correct

mov al, bl				; Move hour from bl to al
mov bl, 60				; Move number 60 to bl
mul bl					; Multiply al (hour) by 60 to convert to minutes
movzx cx, cl			; Extend cl to cx
movzx dx, dl			; Extend dl to dx
add ax, cx				; Add minutes with hours
sub ax, dx				; Subtract snooze time from total


div bl					; Divide ax by 60, AL = hours, AH = minutes

; Checkpoint
; AL: 10 AH: 48 - Done
mov edx, OFFSET string1 ; Moving string1 into edx
call writeString		; Write string1 to console

mov bl, al				; Move al to bl
mov cl, ah				; Move ah to cl

movzx eax, bl			; Extend al to edx
call writeDec			; Write hours to console

mov edx, OFFSET string2 ; Move string2 to edx
call writeString		; write string2 to console

movzx eax, cl			; Extend ah to edx
call writeDec			; Write minutes to console

mov edx, OFFSET string3 ; Move string3 to edx
call writeString		; Write string3 to console


;call dumpRegs




exit
main ENDP


END main