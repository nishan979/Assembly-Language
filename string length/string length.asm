;;;  String Length
.model small
.stack 100h

.data
    str db 'Hello World.', 0
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov si, offset str
    mov cx, 0
    
    len:
    cmp byte [si], 0
    je end
    inc cx
    inc si
    jmp len
    
    end:
    xor dx, dx
    xor bx, bx
    
    add cx, 0h
    mov dx ,cx 
    mov ah, 02h
    int 21h
    mov ah, 4ch
    int 21h
    
    main endp
end main