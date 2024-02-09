   .model small
   .stack 100h
   .code
        main proc   
            
            mov ax, 1000
            mov bx, 32
            sub ax, bx
            mov bx, 5
            mul bx
            mov bx, 9
            div bx
            mov bx , 1
	        add ax, bx

            mov bx, ax
            
            mov ax, 4ch 
            int 21h
            
            
        main endp
    end main
    