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

.code
main PROC

hour:
	mov edx, OFFSET promptHr	; moves promptHR into edx
	
	call writeString		; Writes out "Enter hour of get up time"
	call readDec			; Takes user input for hour of get up time, stores in eax
	;call CrLf
	mov ecx, 23				; cl equals 23
	cmp eax, ecx
	ja errorHr

mov bl, al				; Moves hour to bl

min:
	mov edx, OFFSET promptMin	; moves promptMin into edx
	
	call writeString		; Writes out promptMin to console
	call readDec			; Takes user input (should be for min), stores in eax
	;call CrLf
	mov ecx, 59
	cmp eax, ecx
	ja errorMin

mov bh, al				; Moves minutes to cl

snooze:
	mov edx, OFFSET promptSnooze	; moves promptSnooze into edx
	
	call writeString		; Writes out promptSnooze to console
	call readDec			; Takes user input (for snooze time in min) stores in eax
	;call CrLf
	mov ecx, 59
	cmp eax, ecx
	ja errorSnooze

	mov dl, al

; hour = bl, min = bh, snooze = dl
; Checkpoint - Everything until here is correct

mov al, bl				; Move hour from bl to al
mov bl, 60				; Move number 60 to bl
mul bl					; Multiply al (hour) by 60 to convert to minutes
movzx cx, bh			; Extend cl to cx
movzx dx, dl			; Extend dl to dx
add ax, cx				; Add minutes with hours
sub ax, dx				; Subtract snooze time from total
js errorSub

div bl					; Divide ax by 60, AL = hours, AH = minutes
mov bl, al
mov bh, ah

; Checkpoint
; AL: 10 AH: 48 - Done
; BL: 10 BH: 48

writeHr:
	mov cl, 10
	cmp bl, cl
	jb formatHr
	mov edx, OFFSET string1
	call writeString
	movzx eax, bl
	call writeDec

	mov edx, OFFSET colon
	call writeString
	
writeMin:
	mov cl, 10
	cmp bh, cl
	jb formatMin
	;mov edx, OFFSET string1
	;call writeString
	movzx eax, bh
	call writeDec
	call CrLf
	
	jmp hour



;mov edx, OFFSET string1 ; Moving string1 into edx
;call writeString		; Write string1 to console

;mov bl, al				; Move al to bl
;mov cl, ah				; Move ah to cl

;movzx eax, bl			; Extend al to edx
;call writeDec			; Write hours to console

;mov edx, OFFSET string2 ; Move string2 to edx
;call writeString		; write string2 to console

;movzx eax, bh			; Extend ah to edx
;call writeDec			; Write minutes to console

;mov edx, OFFSET string3 ; Move string3 to edx
;call writeString		; Write string3 to console

;jmp thing

;call dumpRegs

errorHr:
	mov edx, OFFSET errorMsg	; move error to edx
	call writeString
	call CrLf
	jmp hour

errorMin:
	mov edx, OFFSET errorMsg	; move error to edx
	call writeString
	call CrLf
	jmp min

errorSnooze:
	mov edx, OFFSET errorMsg	; move error to edx
	call writeString
	call CrLf
	jmp snooze

errorSub:
	mov edx, OFFSET errorMsg	; move error to edx
	call writeString
	call CrLf
	jmp thing

formatHr:
	mov edx, OFFSET string1
	call writeString
	mov eax, 0
	call writeDec
	movzx eax, bl
	call writeDec
	mov edx, OFFSET colon
	call writeString
	jmp writeMin

formatMin:
	mov eax, 0
	call writeDec
	movzx eax, bh
	call writeDec
	jmp hour

thing:
	exit
main ENDP


END main