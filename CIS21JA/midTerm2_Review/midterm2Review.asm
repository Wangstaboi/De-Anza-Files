TITLE midterm 2 review: sample questions

; Covers modules 5 (branching), 6 (bit-wise instruction / indirect addressing), 7 (procedures / macros)
; The following questions are in the same 2 types of questions you'll see in midterm 2:
; - questions to write code
; - questions to explain code or show results

INCLUDE Irvine32.inc

.data
errorStr BYTE "invalid result",0

var1 SBYTE 90
var2 SBYTE 10
var3 SBYTE -100
arr DWORD 1,2,3,4,5,6,7,8
var4 DWORD -1, -1

.code
main PROC
; The first 3 sample questions are to write code

; 1. write a macro that prints the errorStr (defined above)
; on a separate line of text, with a * character at the beginning and end of the string

; DONE - CHECK ANSWER
printErr MACRO str 
    push edx
    push eax

    mov al, "*"
    call writeChar

    mov edx, OFFSET str
    call writeString
    call writeChar
    call crlf

    pop eax
    pop edx
ENDM 
; 2. write code that implements:
;   var3 = var1 * var2 - var3
; where the variables are defined in .data
;
; if any operation ends up with an invalid result, invoke the
; macro of question 1 
; var1, var2, var3 can contain any data value. You shouldn't rely 
; on the initialized data above when writing code to catch invalid result

; 9 * (-5) - (-100)
; -45 - (-100)
; 55  --- OF should be set in this scenario? JNO would not work.


    mov al, var1            ; var1 = 90 var2 = 10
    ;mov ah, var2           CAN DIRECTLY MUL FROM MEMORY
    imul var2               ; 90 * 10 = 01110000100
    jo error

    ;mov dx, var3           CAN DIRECTLY SUB FROM MEMORY

    sub al, var3

    mov var3, al

    error:
        printErr errorStr



; 3. write a procedure that accepts 2 input arguments: an array 
; of DWORDs and the number of elements. The procedure zeroes out all 
; the elements at each even index (index 0, 2, 4...)
;
; the procedure call is given here:

; Stack Frame
; -----------
; ret value             --+16-- DONT NEED THIS (NO RETURN VALUE)
; arr                   +12
; length of arr         +8
; call address          +4
; ebp
; eax                   -4
; ecx                   -8


proc1 PROC 
    ;sub esp, 4
    push ebp
    mov ebp, esp
    push eax
    push ecx
    mov eax, [ebp + 12]
    mov ecx, [ebp + 8]

    zeroLoop:
        mov DWORD PTR [eax], 0
        add eax, 8              ; Move arr index down 2 (2 BYTES)
        sub ecx, 2
        cmp ecx, 0
        jg zeroLoop

    pop ecx
    pop eax
    pop ebp

    ret 8

proc1 ENDP
    

;sub esp, 4
push OFFSET arr ; Need to OFFSET to access through ptr     
push LENGTHOF arr   
call proc1

exit
main ENDP


END main


COMMENT !

These sample questions are to read code

4. With the procedure call to proc1 of question 3, show a diagram
of the stack frame of proc1 at the point right after all the even indexed
elements have been zeroed out. 
For each value in the stack frame, you can either put the register 
name that holds the value (such as: eax), or describe what the value 
is (such as: return addr in main)
Make sure to list the values in the order that they appear in the stack,
and show where the stack top is


; ANSWER
; Stack Frame
; -----------
; ADDRESS arr                   +12
; length of arr (8)         +8
; call address          +4
; ebp
; eax                   -4
; ecx                   -8


5. Show the value of all registers that are changed after each
instruction

xor al, al	; AL: 0000 0000	
or al, 82h	; AL: 1000 0010	
shl al, 1	; AL: 0000 0100	 CF: 1	
jc L1		; jmp to L1		
and bl, 0
jz L2
L1: not al	; 1111 1011		
L2:


6. Using the same arr defined in main above, show the values in the array
after this code segment:

mov edx, OFFSET arr         ; edx = arr address	(arr[0])		
add edx, LENGTHOF arr		; edx + 8 = arr[2]
add DWORD PTR [edx], 2		; arr[2] + 2 = 3 + 2 = 5
sub edx, 4					; arr[2] - 4 = arr[1]ined in .data
;
; if any operation ends up wit
add DWORD PTR [edx], 4		; arr[1] = 2, 2 + 4 = 6

; 1, 6, 5, 4, 5, 6, 7, 8

7. Explain why you need to run:  mov ebp, esp     in a procedure that
accepts arguments through the stack

; 
; Need to move ESP to ebp so you have a frame of reference when accessing other stack elements. EBP is then 1 slot away. 
;  
; There's a reason its called the Extended Stack Pointer

Explain why you generally don't need to run:  mov ebp, esp   in a procedure that
acccepts arguments through registers

; mov ebp, esp is only done when accessing the stack. When performing operations on registers it does nothing.

!