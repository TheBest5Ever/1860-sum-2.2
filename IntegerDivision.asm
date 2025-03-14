@R2
M=0
@R3
M=0
@R4
M=0

// Check if denominator is zero 
@R1
D=M
@ERROR
D;JEQ

@R0     // Store numerator and denominator in temp registers

D=M
@R5
M=D      // Store numerator in R5
@R1
D=M
@R6
M=D     // Store denominator in R6

// Check if numerator is negative
@R5
D=M
@NUM_NEGATIVE
D;JLT  // If numerator < 0, go to NUM_NEGATIVE
@CHECK_DEN_SIGN
0;JMP

(NUM_NEGATIVE)
@R5
M=-M  // Make numerator positive
@R7
M=1   // Set R7 = 1 (flag for negative numerator)

(CHECK_DEN_SIGN)
// Check if denominator is negative
@R6
D=M
@DEN_NEGATIVE
D;JLT  
@DIVISION_LOOP
0;JMP

(DEN_NEGATIVE)
@R6
M=-M  // Make denominator positive
@R8
M=1   // Set R8 = 1 (flag for negative denominator)

// Perform division using repeated subtraction
(DIVISION_LOOP)
@R5
D=M
@R6
D=D-M
@END_DIVISION
D;JLT  // If numerator < denominator, stop

@R2
M=M+1  // Increment quotient
@R5
M=D  // Update numerator
@DIVISION_LOOP
0;JMP


(END_DIVISION)
@R5
D=M
@R3
M=D  // Store remainder

// If numerator was negative, make remainder negative
@R7
D=M
@END
D;JEQ  // If R7 == 0  jump
@R3
M=-M  // Negate remainder

// Determine quotient sign using R7 and R8 flags
@R7
D=M
@R8
D=D-M  // D = R7 - R8
@END
D;JEQ  // If both signs were same, quotient is correct
@R2
M=-M  // Negate quotient

(ERROR)
@R4
M=1  
@END
0;JMP

(END)
@END
0;JMP
