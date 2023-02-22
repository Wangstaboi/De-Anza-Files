TITLE Module 5 Exercise					

INCLUDE Irvine32.inc

.data
myS BYTE "Hello"

.code
main PROC

;;;;;;;;;;;;;;;;;;;; part 1 ;;;;;;;;;;;;;;;;;
; unconditional JMP
; which instructions below will run?

L2: 
    mov eax, 5		; yes
	jmp L1			; yes (skips to L1)
	mov ebx, 6		; no
	mov ecx, 7		; no
	jmp L2			; no
L1:   
	mov edx, 8		; yes
	  

; LOOP 
; what is the value of eax after the loop finishes? 
	mov ecx,4
	mov eax,0
L3:
	inc eax		; 
	loop L3		; 
				; 

;;;;; loop runs amount of times set in ecx (i.e. if ecx is 4, loop runs 4 times)
	
; what if, in the loop above, we use: mov ecx, 0 instead of: mov ecx, 4
; will the loop run? 
; how many times? 


; write a nested loop using LOOP instructions: the outer loop runs 5 times
; the inner loop runs 3 times

mov eax, 0



; implement the same nested loop without LOOP instruction



;;;;;;;;;;;;;;;;; part 2 ;;;;;;;;;;;;;;;;;;;;;;

; write code to jump to L10 if the carry flag is set after adding ax and bx
; assume ax and bx have values

; write code to jump to L20 if ax > bx (signed data)

; write code to jump to L30 if ax > bx (unsigned data)




; implement the following pseudocode to work with signed data
; if (ax <= 10 AND bx > 0)    ;ax = 5, bx = 5
;   dx = 0
; else
;   dx = 5





; implement the following pseudocode to work with unsigned data
; while (ax > bx OR cx != 0)
; {
;    bx = bx * 2
;    cx = cx - 1
; }






;;; if (ax > bx AND bx > cx OR dx == 0)  ;; unsigned
;;;   si = 0
;;; else
;;;   si = 1



	exit
main ENDP

END main