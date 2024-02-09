.MODEL SMALL
.STACK 100H
.DATA
A DW ?
SUM DW ?

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        MOV AH, 1
        INT 21H
        MOV A, AX
        
        XOR BX, BX
        MOV AX, A
        MOV CX, AX
        
        START:
        ADD BX, CX
        
        LOOP START
        
        MOV SUM, BX
        

        
        ;MOV AH, 4CH
        ;INT 21H
        
        MAIN ENDP
    END MAIN
