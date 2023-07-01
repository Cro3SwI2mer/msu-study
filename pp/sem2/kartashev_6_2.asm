include C:\MASM614\include\console.inc

.data

n dw ?
k dw ?

.code

start:
    inint n
    inint k
    
    xor bx, bx
    xor cx, cx
    
    mov ax, n
    mov dx, k
    
ls:
    div dl
    cmp ah, cl
    ja gr
    je el
    jb lend
    
gr:
    mov cl, ah
    mov bx, dx
    jmp lend
    
el:
    mov bx, dx
    jmp lend

lend:
    mov ax, n
    dec dx
    cmp dx, 2
    jae ls
    jb fin
    
fin:
    outstr 'BX:= '
    outnumln bx,,d
    outstr 'CX:= '
    outnumln cx,,d

    exit
end start
