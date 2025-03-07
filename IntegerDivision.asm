@R2
M=0

@R3
M=0

@R0
D=M

@DONE
D;JEQ

@R1
D=M

R0
D=M

(NOTDONE)
@R1
D=D-M

@R3
M=D

@R2
M=M+1

@NOTDONE
D;JLE






@R2
M=0  

@R0
D=M  

@END
D;JEQ  

@R1
D=D-M

@END
D;JLT

@R1
D=M  

@UNDEFINED
D;JEQ  

(LOOP)
    @R0
    D=M  
    @R1
    D=D-M  // Subtract R1 from R0

    @END  // If result < 0, stop the loop
    D;JLT  

    // Store new R0 value
    @R0
    M=D  

    // Increment quotient (R2++)
    @R2
    M=M+1  

    @LOOP  // Repeat
    0;JMP  

// Handle division by zero case
(DIV_BY_ZERO)
    @R2
    M=0  // Set quotient to 0
    @R3
    M=0  // Set remainder to 0
    @EXIT
    0;JMP

// Store remainder in R3
(END)
    @R0
    D=M  
    @R3
    M=D  // Store remainder

(EXIT)
    @EXIT
    0;JMP  // Infinite loop to stop execution