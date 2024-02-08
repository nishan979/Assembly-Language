.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER ANY CHARACTER: ', '$'
    MSG2 DB 'THIS CHARACTER IS VOWEL' , '$'
    MSG3 DB 'THIS CHARACTER IS NOT VOWEL', '$'
    NEW DB 0DH, 0AH, '$'
    
.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        MOV AH, 9    
        LEA DX, MSG1
        INT 21H
         
        MOV AH, 1
        INT 21H  
        
        MOV BL, AL
        
        MOV AH, 9
        LEA DX, NEW
        INT 21H
        
        MOV AL, BL
        
        CMP AL, 'A'
        JE IS_VOWEL
        CMP AL, 'E'
        JE IS_VOWEL
        CMP AL, 'I'
        JE IS_VOWEL
        CMP AL, 'O'
        JE IS_VOWEL
        CMP AL, 'U'
        JE IS_VOWEL
        CMP AL, 'a'
        JE IS_VOWEL
        CMP AL, 'e'
        JE IS_VOWEL
        CMP AL, 'i'
        JE IS_VOWEL
        CMP AL, 'o'
        JE IS_VOWEL
        CMP AL, 'u'
        JE IS_VOWEL
        
        MOV AH, 9
        LEA DX, MSG3
        INT 21H
        JMP EXIT
        
        
        IS_VOWEL:
            MOV AH, 9
            LEA DX, MSG2
            INT 21H
            JMP EXIT
               
        EXIT:
            MOV AX, 4CH
            INT 21H
        
        MAIN ENDP
    END MAIN
    