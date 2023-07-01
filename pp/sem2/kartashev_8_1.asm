include C:\MASM614\include\console.inc

.data

m dd 26 dup (0)
r db ?  

.code

start:

    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    loopstart:
        
        inchar r
        mov al, r
        cbw
        cwde
        cmp eax, 46
        ;outintln eax
        ja letter
        je loopend
    
    letter:
    
        mov ebx, eax
        sub ebx, 97
        add m[ebx*4], 1
        jmp loopstart
    
    loopend:
    
    mov ecx, 26
    mov edx, 0
    mov ebx, 0
    
    calcans:
        
        cmp m[ebx*4], 0
        ja inline
        je next
        
    inline:
        
        add edx, 1
        jmp next    
    
    next:
        
        inc ebx
        dec ecx
        cmp ecx, 0
        ja calcans
        je calcend
    
    calcend:
    
    outintln edx

    exit
end start
