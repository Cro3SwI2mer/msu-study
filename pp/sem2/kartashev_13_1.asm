include C:\MASM614\include\console.inc

sign1 macro x

    push bx
    mov bl, x
    cmp bl, 0
    jmp comparison1
        
    comparison1:
        jg greater1
        je equal1
        jl less1
    
    greater1:
        mov al, 1
        jmp finish1
        
    equal1:
        mov al, 0
        jmp finish1
    
    less1:
        mov al, -1
        jmp finish1
    
    finish1:
        pop bx
        
endm

sign2 macro x

    push bx
    mov bx, x
    cmp bx, 0
    jmp comparison2
        
    comparison2:
        jg greater2
        je equal2
        jl less2
    
    greater2:
        mov al, 1
        jmp finish2
        
    equal2:
        mov al, 0
        jmp finish2
    
    less2:
        mov al, -1
        jmp finish2
    
    finish2:
        pop bx
        
endm

sign4 macro x

    push ebx
    mov ebx, x
    cmp ebx, 0
    jmp comparison3
        
    comparison3:
        jg greater3
        je equal3
        jl less3
    
    greater3:
        mov al, 1
        jmp finish3
        
    equal3:
        mov al, 0
        jmp finish3
    
    less3:
        mov al, -1
        jmp finish3
    
    finish3:
        pop ebx
        
endm

sign macro x

    push ecx
    mov ecx, type x
    
    cmp ecx, 1
    je data1
    
    cmp ecx, 2
    je data2
    
    cmp ecx, 4
    je data4
    
    data1:
        sign1 x
        jmp finish
    
    data2:
        sign2 x
        jmp finish
    
    data4:
        sign4 x
        jmp finish
        
    finish:
        pop ecx  
        
endm

.data

x1 db ?
x2 dw ?
x3 dd ?

.code

start:

    x equ x2

    inint x
    
    sign2 x

    outintln al
    
    exit
end start
