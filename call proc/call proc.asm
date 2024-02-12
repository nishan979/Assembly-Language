.data 
strArray db 'Hello World$'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, strArray
    call user
    
    mov ah, 4ch
    mov al, 00h
    int 21h
    
    main endp
user proc
    mov ah, 09h
    int 21h
    ret
    user endp
end main