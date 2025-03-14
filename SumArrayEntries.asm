@R1
D=M
@CHECK_EMPTY        //check if the list is empty
D;JLE

@R2
M=0
@R3         //sets sum and index counter 
M=0

@LOOP
@R3
D=M
@R1
D=D-M           //check if index is less than the number of elements in the list
@END_LOOP
D;JGE

@R0
D=M
@R3
A=D+A               //accesses the element at the index
D=M

@R2
M=M+D       //adds the current element in the array

@R3
M=M+1           //increments index counter

@LOOP
0;JMP

@CHECK_EMPTY
0;JMP

@END_LOOP
0;JMP
