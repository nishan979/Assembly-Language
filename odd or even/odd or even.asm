.MODEL SMALL 
.STACK 100H 
.DATA 
    MSG1 DB 10,13,"Enter any number: $" 
    MSG_ODD DB 10,13,"The number is ODD.$" 
    MSG_EVEN DB 10,13,"The number is EVEN.$" 
    MSG2 DB 10,13,"Do you want to continue? (Y/N): $" 
    INPUT_CHAR DB ? 
    NUM DW ? 
    REMINDER DB ? 
    CONTINUE_FLAG DB 'Y' 
    .CODE 
        MAIN PROC 
        MOV AX, @DATA 
        MOV DS, AX 
        MAIN_LOOP: 
        MOV AH, 09H 
        LEA DX, MSG1 
        INT 21H 
        MOV AH, 01H 
        INT 21H 
        SUB AL, 30H  
        MOV NUM, AX
        MOV AX, NUM 
        MOV BX, 2 
        DIV BX 
        MOV REMINDER, DL  
        CMP REMINDER, 0 
        JE RESULT  
        MOV AH, 09H 
            LEA DX, MSG_ODD 
            INT 21H 
            JMP ASK_TO_CONTINUE 
         
        RESULT: 
         
            MOV AH, 09H 
            LEA DX, MSG_EVEN 
            INT 21H 
         
        ASK_TO_CONTINUE:
            MOV AH, 09H 
            LEA DX, MSG2 
            INT 21H 
         
            MOV AH, 01H 
            INT 21H 
            MOV INPUT_CHAR, AL 
                                                    
            CMP INPUT_CHAR, 'Y' 
            JE CONTINUE_PROGRAM 
            CMP INPUT_CHAR, 'y' 
            JE CONTINUE_PROGRAM    
             
             
            CMP INPUT_CHAR, 'N' 
            JMP END 
            CMP INPUT_CHAR, 'n' 
            JMP END 
         
         
        CONTINUE_PROGRAM: 
            JMP MAIN_LOOP 
         
        END: 
            MOV AH, 4CH 
            INT 21H 
         
        MAIN ENDP 
     
END MAIN 