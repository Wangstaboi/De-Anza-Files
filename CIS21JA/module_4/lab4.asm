TITLE  Lab 4: Calculate alarm time, and predict flag values
		
; Don't forget this beginning documentation with your name
; Name: Ryan Wang


INCLUDE Irvine32.inc

; Part 1 
.data
promptHr BYTE "Enter hour of get up time: ",0
promptMin BYTE "Enter minute of get up time: ",0
promptSnooze BYTE "Enter number of minutes of snooze: ",0

.code
main PROC

mov edx, OFFSET promptHr	; moves promptHR into edx
call writeString		; Writes out "Enter hour of get up time"
call readDec			; Takes user input for hour of get up time, stores in eax

mov edx, OFFSET promptMin	; moves promptMin into edx
call writeString		; Writes out "Enter minute of get up time"
mov ecx, eax			; Stores hour in edx
call readDec			; stores minutes in eax
mov ebx, 0			; stores minutes in ebx
mov ebx, eax

mov edx, OFFSET promptSnooze	; moves promptSnooze into edx
call writeString		; Writes out "Enter num of min of snooze"
call readDec			; Stores min of snooze into eax

; hr: ecx, min: ebx, snoozeMIn: eax

; swap ecx and eax
xchg ecx, eax


; Convert Hours to Min
mul 60 ; result in edx

add edx, ebx		; Add min to hours (in minute form)
sub edx, ecx		; Subtracting snooze time from total

; Convert back to hrs and min



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
; a. ZF =   SF =   CF =   OF =
; b. explanation for CF:
;    explanation for OF:

sub al, 0A0h     
; a. ZF =   SF =   CF =   OF =
; b. explanation for CF:
;    explanation for OF:
@