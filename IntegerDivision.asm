@R2
M=0
@R3         //set up
M=0
@R4
M=0

@R1
D=M         //check if denominator is 0 if so jumps to error
@ERROR
D;JEQ

@R0
D=M
@R5
M=D
@R1
D=M             //store numerator and denominator
@R6
M=D

@R5
D=M
@NEGATIVE_NUMERATOR         //jumps if numerator is negative
D;JLT   
@NEGATIVE_DENOMINATOR       //jumps if denominator is negative
@R6
D=M
D;JLT
@MAIN_LOOP
0;JMP

(NEGATIVE_NUMERATOR)
@R5                 //make numerator positive
M=-M
@R6
D=M
@NEGATIVE_DENOMINATOR       
D;JLT
@MAIN_LOOP
0;JMP

(NEGATIVE_DENOMINATOR)
@R6
M=-M                    //make denominator positive
@MAIN_LOOP
0;JMP

(MAIN_LOOP)
    @R5
    D=M                         //subtracts denominator from numerator
    @R6
    D=D-M
    @END_DIVISION               
    D;JLT

    @R2
    M=M+1                       //quotientt increases by 1

    @R5                         //stores new numerator
    M=D

    @MAIN_LOOP                  //loop repeats 
    0;JMP

(END_DIVISION)
    @R5
    D=M
    @R3
    M=D             //stores remainder

@R0
D=M
@RESTORE_REMAINDER_SIGN
D;JLT                       //if numerator is negative remainder is negative
@R1
D=M
@RESTORE_QUOTIENT_SIGN
D;JLT                       //if denominator is negative quotient is negative 
@END
0;JMP

(RESTORE_REMAINDER_SIGN)
    @R3
    M=-M                     
    @R1
    D=M
    @RESTORE_QUOTIENT_SIGN
    D;JLT
    @END
    0;JMP

(RESTORE_QUOTIENT_SIGN)
    @R0
    D=M
    @R1
    D=D*M
    @R2
    M=D
    @END
    0;JMP

(ERROR)
    @R4
    M=1
    @END
    0;JMP

(END)
    @END
    0;JMP
