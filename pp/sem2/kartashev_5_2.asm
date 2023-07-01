include C:\MASM614\include\console.inc

.data

x db ?
y db ?
n db ?

m db ?
x1 db ?
y1 db ?

.code
start:
    inint x
    inint y
    inint n
    
    outnum x,,b
    outchar ' '
    outnum y,,b
    outcharln ' '
    
    mov cl, 8
    sub cl, n
    mov m, cl
    
    mov al, x
    mov bl, y
    
    shr al, cl
    shl al, cl
    
    mov cl, n
    shl bl, cl
    shr bl, cl
    
    or al, bl
    mov y1, al
    
    mov al, y
    mov bl, x
    
    shl bl, cl
    shr bl, cl
    
    mov cl, m
    shr al, cl
    shl al, cl
    
    or al, bl
    mov x1, al
    
    outnum x1,,b
    outchar ' '
    outnum y1,,b
    outcharln ' '
    
    outword x1
    outchar ' '
    outword y1
    outcharln ' '

    exit
end start
