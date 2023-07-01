include C:\MASM614\include\console.inc

.data

x dw ?
y dw ?

z0 dw ?
z1 dw ?
z2 dw ?
z3 dw ?

.code
start:
    inint x
    inint y
    
    mov bl, byte ptr [y]
    mov bh, byte ptr [y+1]
    
    xor eax, eax
    mov al, byte ptr [x]
    mul bl
    mov z0, ax
    
    xor eax, eax
    mov al, byte ptr [x+1]
    mul bl
    mov z1, ax
    
    xor eax, eax
    mov al, byte ptr [x]
    mul bh
    mov z2, ax
    
    xor eax, eax
    mov al, byte ptr [x+1]
    mul bh
    mov z3, ax
    
    xor eax, eax
    
    mov ax, z0
    mov dx, z3
    mov cl, byte ptr [z1]
    add ah, cl
    adc dl, 0
    mov cl, byte ptr [z2]
    add ah, cl
    adc dl, 0
    mov cl, byte ptr [z1+1]
    add dl, cl
    adc dh, 0
    mov cl, byte ptr [z2+1]
    add dl, cl
    adc dh, 0
    
    push dx
    push ax
    pop eax
    
    outstr 'a) '
    outint eax
    outcharln ' '
    
    div bx
    
    outstr 'b) '
    outint ax
    outcharln ' '

    exit
end start
