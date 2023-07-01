include C:\MASM614\include\console.inc

.data

s db 256 dup(?)
t db 101 dup(?)

.code

start:

    inputstr offset s, 256
    mov ebx, eax
    inputstr offset t, 101
    mov ecx, eax
    sub ebx, eax
    inc ebx
    
    xor eax, eax
    
    ;outintln ebx
    
    compare:
    
    cld
    
    lea esi, [s+eax]
    lea edi, t
    
    ;outstrln esi
    
    push ecx
    
    bytecompare:
        
        cmpsb
        jne nequal
        
        dec ecx
        cmp ecx, 0
        jne bytecompare
        
    pop ecx
    
    jmp equal
    
    equal:
    
        outnumln 1,,d
        jmp finish
    
    nequal:
    
        inc eax
        dec ebx
        cmp ebx, 0
        
        jne compare
        
        outnumln 0,,d
        jmp finish
        
    finish:
    
    exit
end start
