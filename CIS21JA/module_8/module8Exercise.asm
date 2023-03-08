TITLE Module8Exercise						

INCLUDE Irvine32.inc


space macro ; macro to print a single space
push eax
mov eax,' '
call writeChar
pop eax
endm

numrow = 3
numcol = 5

.data
arr WORD 1,2,3,3,4,4,5,6,2,2,2,7,5,5,5
uniq WORD 15 dup(0)

twoD WORD 0,1,2,3,4
     WORD 10,11,12,13,14
     WORD 20,21,22,23,24
;or	 
;twoD WORD 0,1,2,3,4,10,11,12,13,14,20,21,22,23,24

.code

main PROC
; part 1: copy arr into uniq, print uniq to check


; part 2: zero out uniq


; part 3: copy arr into uniq, but don't copy consecutive 
; duplicate numbers


; part 4: implement: ax = twoD[2][3] 


; part 5: implement: ax = twoD[1][2] 
;          by using ebx
mov ebx, OFFSET twoD


exit
main ENDP

END main