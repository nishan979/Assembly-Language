.MODEL SMALL
.STACK 100H
.DATA
    arr1 db 'a', 'b', 'c', 'd', 'e'
    arr2 db 1,2,3,4,5
    
.CODE 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        
        mov cx, 5
        mov si, offset arr1
            
        loop_start: 
            mov dx, [si]
            mov ah, 2
            int 21h
            inc si
            
            loop loop_start
      ;  mov ah, 2
      ;  mov dl, 0dh
       ; int 21h
      ;  mov dl, 0dh
       ; int 21h
        
        xor ax, ax
        xor dx, dx
        xor cx, cx
        
        mov cx, 5
        mov si, offset arr2    
        
            
        loop_start2:
            mov dx, [si]
            add dl, 48
            mov ah, 2
            int 21h
            inc si
            loop loop_start2       
        
        MOV AX, 4CH
        INT 21H
        
        MAIN ENDP
    END MAIN
     