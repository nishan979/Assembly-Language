 .model small

 .data
  myArray DB 10, 20, 30, 40, 50
  arraySize DW 5
  searchValue DB 50
  newline DB 10, 13, '$'

 not_found_msg DB 'Value not found in the array.$'
 found_msg DB 'Value found in the array.$'

 .code

  main PROC

    mov ax, @data
    mov ds, ax

    xor si, si

    search_loop:

        cmp si, arraySize 
        je value_not_found
        
        mov al, [myArray  + si]
        cmp al, searchValue
        
        je value_found
        
        inc si
        jmp search_loop
    
    value_found:
        mov ah, 09h
        lea dx, found_msg
        int 21h
        jmp end_program
        
    value_not_found:
        mov ah, 09h
        lea dx, not_found_msg
        int 21h
    end_program:
        mov ah, 4ch
        int 21h
   
    main endp
  end main
   
     
    