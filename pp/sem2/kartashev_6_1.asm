include C:\MASM614\include\console.inc

.data

n dw ?
k db ?

.code

start:
    inint n
    mov ax, n
    mov bl, 3
    xor cl, cl

l:
    div bl
    cmp ah, 0
    jne no
    inc cl
    cmp al, 1
    jne l
    mov k, cl
    jmp fin
    
no:
    mov k, -1
    jmp fin
    
fin:
    outintln k

    exit
end start
