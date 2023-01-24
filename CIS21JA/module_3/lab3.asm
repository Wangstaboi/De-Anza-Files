TITLE Lab 3: assembly language fundamentals				

;;;;; Q1: Don't forget to document your program 			
; Name: 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; Answer each question below by writing code at the APPROPRIATE places in the file.
;;;;; Hint: the appropriate place is not always right below the question.

;;;;; Q2: Write the directive to bring in the IO library			

;;;;; Q3: Create a constant called MAX and initialize it to 120

;;;;; Q4: Create a constant called MIN and intialize it to 25% of MAX by using an
;;;;;     integer expression constant (use the constant MAX and not the number 120)    

;;;;; Q5: Define an array of 20 signed doublewords, use any array name you like. 
;;;;; Initialize:
;;;;;	- the 1st element to -150 
;;;;;	- the 2nd element to the hexadecimal value A2F
;;;;;	- the 3rd element to the binary value 10100 
;;;;;	- the 4th element to MAX (from Q3). Use the constant MAX, not 120.
;;;;; and leave the rest of the array uninitialized.  

;;;;; Q6. Define the string "Num = ", use any variable name you like.

;;;;; Q7. Define a prompt that asks the user for a number.

;;;;; Q8. Write code to store the value of MIN into eax, then print the value
;;;;;     to screen. 
;;;;;     Use the string you defined in Q6 as the text explanation for your output.

;;;;; Q9. Write code to prompt the user for a number, using the prompt string that 
;;;;;     you defined in Q7.

;;;;; Q10. Write code to read in the user input, which you can assume is always
;;;;;      a positive number. Hint: use the correct library routine for positive number.

;;;;; Q11. Write code to print "Num = " and then echo to screen the user input.

;;;;; Q12. Write code to print "Num = " and then print the first element of the 
;;;;;      array defined in Q5.

;;;;; Q13. Build, run, and debug your code.

;;;;; Your output should be similar to this (without the commented explanation):
;;;;; Num = 30								; printing MIN
;;;;; Enter a positive number: 7            ; prompt the user for a number and read it in
;;;;; Num = 7								; echo user input
;;;;; Num = -150							; print first element of array
;;;;; Press any key to continue . . .

;;;;; Q14. At the end of the source file, without using semicolons (;), add a comment block
;;;;;      to show the 8 bytes of bigData in memory by copying them from the Debug->Memory
;;;;;      window. 
;;;;;      Then explain why the 8 bytes don't look the same as how bigData is defined. 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.data
bigData QWORD 0abcdef0123456789h		; same bigData value as last lab


.code
main PROC



	exit	
main ENDP

END main