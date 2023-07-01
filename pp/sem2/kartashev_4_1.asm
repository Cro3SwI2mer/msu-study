include C:\MASM614\include\console.inc

.data

t dd ?

n1 dw 3600
n2 dw 60

h db ?
m db ?
s db ?

.code
start:
    inint t
    
    xor dx, dx
    xor ax, ax
    xor bx, bx
    
    mov dx, word ptr [t+2]
    mov ax, word ptr [t]
    
    mov bx, n1
    div bx
    mov h, al
    
    mov ax, dx
    cwd
    
    mov bx, n2
    div bx
    mov m, al
    mov s, dl
    
    outint h
    outchar ':'
    outint m
    outchar ':'
    outint s
    
    exit
end start