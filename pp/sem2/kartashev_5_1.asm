include C:\MASM614\include\console.inc

.data

x dw ?
y dw ?

.code
start:
    inint x
    
    xor ax, ax
    xor bx, bx
    xor cx, cx
    
    mov ax, x
    mov bx, x
    mov cx, x
    
    shl ax, 2
    shr bx, 3
    shl cx, 12
    shr cx, 12
    sub ax, bx
    add ax, cx
    
    mov y, ax
    outstr 'a) '
    outword y
    outcharln ' '
    
    xor ax, ax
    xor bx, bx
    xor cx, cx
    
    mov ax, x
    mov bx, x
    mov cx, x
    
    shl ax, 5
    shl bx, 1
    add ax, bx
    add ax, cx
    
    mov y, ax
    outstr 'b) '
    outword y
    outcharln ' '

    exit
end start
