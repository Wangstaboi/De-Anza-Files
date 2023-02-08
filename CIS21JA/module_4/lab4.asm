TITLE  Lab 4: Calculate alarm time, and predict flag values
		
; Don't forget this beginning documentation with your name
; Name: Ryan Wang


INCLUDE Irvine32.inc

; Part 1 
.data
promptHr BYTE "Enter hour of get up time: ",0
promptMin BYTE "Enter minute of get up time: ",0
promptSnooze BYTE "Enter number of minutes of snooze: ",0
string1 BYTE "Alarm set for ",0
string2 BYTE " Hour and ",0
string3 BYTE " minute",0

.code
main PROC

mov edx, OFFSET promptHr	; moves promptHR into edx
call writeString		; Writes out "Enter hour of get up time"
call readDec			; Takes user input for hour of get up time, stores in eax

mov bl, al				; Moves hour to bl

mov edx, OFFSET promptMin	; moves promptMin into edx
call writeString		; Writes out promptMin to console
call readDec			; Takes user input (should be for min), stores in eax

mov cl, al				; Moves minutes to cl

mov edx, OFFSET promptSnooze	; moves promptSnooze into edx
call writeString		; Writes out promptSnooze to console
call readDec			; Takes user input (for snooze time in min) stores in eax

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








COMMENT @
Question 2 (5pts)
Assume ZF, SF, CF, OF are all 0 at the start, and the 3 instructions below run one after another. 
a. fill in the value of all 4 flags after each instruction runs 
b. explain why CF and OF flags have that value 
   Your explanation should not refer to signed or unsigned data values, 
   such as "the result will be out of range" or "204 is larger than a byte"
   or "adding 2 negatives can't result in a positive"
   The ALU doesn't see signed vs. unsigned data and yet it can set the flags.
   Your answer should use the reasoning that the ALU (hardware) uses.


mov al, 0C0h 

add al, 50h     
; a. ZF = 1  SF = 0  CF = 1  OF = 1
; b. explanation for CF: Add operation too big for al, therefore carry flag is 1 	
;    explanation for OF: MSB is set to 1, therefore OF is 1

sub al, 0A0h     
; a. ZF = 1  SF = 0  CF = 0  OF = 0
; b. explanation for CF: Subtracting means smaller number, means no way itll have to carry (ends in 0 so positive)
;    explanation for OF: Subtracting means smaller, so no overflow (also its positive)
@