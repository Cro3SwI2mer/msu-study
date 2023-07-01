include C:\MASM614\include\console.inc

.data

r db ?
rs dw ?  

.code

start:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx
    xor esi, esi
    xor edi, edi

    inint r
    
    mov bl, r
    cbw
    mov si, bx
    
    mov al, r
    mul al
    cwde
    mov edi, eax
    
    xor eax, eax
    xor ebx, ebx
    xor edx, edx
    
    mov bx, 0
    push 0
    
    lstart:
    
        push bx
        mov ax, si
        mul ax
        push dx
        push ax
        pop ecx
        mov ax, bx
        mul ax
        push dx
        push ax
        pop ebx
        add ebx, ecx
        cmp ebx, edi
        
        ;outint ebx
        ;outchar ' '
        ;outintln ecx
    
        ja above
        jbe boe
    
        above:
            ;outstrln 'In above'
            dec si
            pop bx
            cmp si, 0
            ja lstart
            je lend
            
        boe:
            ;outstrln 'In boe'
            pop bx
            pop edx
            push si
            cwde
            add edx, esi            
            pop si
            push edx
            inc bx
            jmp lstart
    
    lend:
        pop edx
        shl edx, 2
        add edx, 1
        outintln edx 

    exit
end start
