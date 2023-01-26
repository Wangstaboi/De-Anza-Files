TITLE Module 3 Exercise					

; The following class exercise is for module 2
; Topics: Assembly Fundamentals and Library Calls

; 1. Use the comment directive instead of ; for 
; the first 4 lines of comments


; 2. Name the directives that you see in the code:


INCLUDE Irvine32.inc

; 3. define a constant for the number of seconds in an hour
; by using an integer expression constant
secInHr = 60 * 60

.data
; 4. define a prompt: enter your name
myPrompt BYTE "enter your name: ",0

; 5. define memory space to store someone's name (20 characters for name)
uname BYTE 21 DUP(?)

hi BYTE "Hi, ",0	; Hi string to print out

; 6. define a byte and initialize with binary 100
myByte BYTE 100b

; 7. define a word and initialize with hexadecimal A0 
myWord WORD 0A0h

; 8. define a doubleword and initialize with -10
myDword SDWORD -10
									
; 9. define an array of 5 doublewords and initialize with the values 1,2,3
; and leaving the last 2 elements uninitialized
myArr DWORD 1, 2, 3, 2 DUP(?)

.code
main PROC

; 10. write code to print the prompt
mov edx, OFFSET myPrompt
call writeString

; 11. write code to read in the user's name
mov edx, OFFSET uName
mov ecx, 21
call readString

; 12. write code to print "Hi, <user's name>" where user's name is what you read in
mov edx, OFFSET hi ; print hi string
call writeString
mov edx, OFFSET uName ; print uName string
call writeString
call crlf				; print newline
; 13. write code to store the immediate value -1 in eax
mov eax, -1

; 14. write code to print the word defined in step 7
mov eax, 0
mov ax, myWord
call writeDec    ; priting unsigned Data

; 15. write code to print the doubleword defined in step 8
mov eax, myDword
call writeInt

call readInt	; signed Data
call readDec	; unsigned Data

; 16. use the debugger's memory window and identify what your data
; definitions look like in mememory



; 17. show what the array of 5 doublewords look like. 
; Why does it look like that?



	exit	
main ENDP

END main
