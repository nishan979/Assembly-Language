 MACRO_CALL MACRO VALUE
 MOV SI, 0
 MOV CH, 0 
 MOV CL, VALUE
 INPUT:
     MOV AH, 1
     INT 21H
     MOV ARR[SI], AL
     INC SI 
     LOOP INPUT
 ENDM





.MODEL SMALL
.STACK 100h
.DATA        
      ARR DB 50 DUP(?)
      VAL DB ? 
      MSG1 DB 'HOW MANY NUMBER YOU WANT TO TAKE', 0DH, 0AH, '$'
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        XOR BX, BX
        XOR AX, AX
        
        MOV AH, 09H
        LEA DX,  MSG1
        INT 21H  
        
        MOV AH, 1
        INT 21H
        AND AL, 0FH
        
        MOV CL, AL
        MOV VAL, CL
        
        MACRO_CALL VAL 
        
        MOV SI, 0
        LOOP_FIND:
            
         
        
        
        
        

     MAIN ENDP    
    
END MAIN


