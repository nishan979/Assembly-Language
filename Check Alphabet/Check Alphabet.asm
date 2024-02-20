   .model small
   .stack 100h
   .data
       msg1 db 'Enter any number or alphabet: $'
       msg2 db 'This is a number$'
       msg3 db 'This is an alphabet$'
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
            
            mov bl, al
            
            mov ah, 09h
            lea dx, new
            int 21h
            
            mov al ,bl
            
            
            cmp al, '0'
            je num
            cmp al, '1'
            je num
            cmp al, '2'
            je num
            cmp al, '3'
            je num
            cmp al, '4'
            je num
            cmp al, '5'
            je num
            cmp al, '6'
            je num
            cmp al, '7'
            je num
            cmp al, '8'
            je num
            cmp al, '9'
            je num
            
            mov ah, 09h
            lea dx, msg3
            int 21h
            jmp exit
            
            num:
                mov ah, 09h
                lea dx, msg2
                int 21h
                jmp exit
         
            exit:
                mov ax, 4ch
                int 21h
            
            
        main endp
    end main
    