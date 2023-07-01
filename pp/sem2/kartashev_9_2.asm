include C:\MASM614\include\console.inc

date record d:5, m:4, y:7 ; дата в формате "день-месяц-год (две последние цифры)"
date1 record y1:7, m1:4, d1:5 ; дата в формате "год-месяц-день"

.data

a date <>
a1 date1 <>

day   equ 1111100000000000b
month equ 0000011110000000b
year  equ 0000000001111111b

.code

start:

    xor dx, dx
    xor ax, ax
    xor cx, cx

    inint dx
    inint ax
    inint cx
    
    ;outnumln dx,,b
    ;outnumln ax,,b
    ;outnumln cx,,b
    
    shl dx, 11
    shl ax, 7
    
    or dx, ax
    or dx, cx
    mov a, dx
    ;outnumln a,,b
    
    mov dx, a
    and dx, day
    shr dx, 11
    mov ax, a
    and ax, month
    shr ax, 2
    mov cx, a
    and cx, year
    shl cx, 9
    
    or cx, ax
    or cx, dx
    mov a1, cx
    ;outnumln a1,,b
    
    mov dx, a1
    mov ax, a1
    mov cx, a1
    
    shl dx, 11
    shr dx, 11
    
    shl ax, 7
    shr ax, 12
    
    shr cx, 9
    
    outint cx
    outchar '.'
    outint ax
    outchar '.'
    outintln dx
    
    exit
end start
