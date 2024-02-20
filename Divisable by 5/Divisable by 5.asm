   .model small
   .stack 100h
   .data
       msg1 db 'Enter any number: $'
       msg2 db 'The given number is divisible by 5$'
       msg3 db 'The given number is not divisible by 5$'
       new db 0dh, 0ah, '$'
   .code
        main proc
            mov ax, @data
            mov ds, ax
            
            mov ah, 09h
            lea dx, msg1
            int 21h
            
            mov ah, 01h
            int 21h
            mov ah, 0
            mov bl, 48
            sub al, bl
            mov bl, 10
            mul bl
            mov bl, 0
            mov bl, al
            
            mov ah, 1
            int 21h
            mov ah, 0
            mov dh, 0
            mov dl, 48
            sub al, dl
            add al, bl
            mov bl, al
            
            
            mov ah, 09h
            lea dx, new
            int 21h
            
            mov al ,bl
            mov bl, 5
            
            
            mov ah, 0
            div bl
            
            cmp ah, 0
            je divisible
            
            mov ah, 9
            lea dx, msg3
            int 21h
            jmp exit
            
            
            divisible:
                mov ah, 9
                lea dx, msg2
                int 21h
                jmp exit
                
            exit:
                mov ax, 4ch 
                int 21h
            
            
        main endp
    end main
    