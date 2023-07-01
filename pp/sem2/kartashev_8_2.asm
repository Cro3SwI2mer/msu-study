include C:\MASM614\include\console.inc

.data

n dd ?
elem db ?
k db ?
l dd ?
x db 5 dup (0)
y db 6 dup (0)  

.code

start:
    
    inint n
    mov ecx, n
    mov esi, 0
    
    inx:
        inint elem
        mov al, elem
        mov x[esi], al
        inc esi
        dec ecx
        cmp ecx, 0
        ja inx
    
    mov esi, 0
    mov y[esi], 0
    mov ecx, n
    
    iny:
        mov al, byte ptr x[esi]
        mov bl, byte ptr y[esi]
        inc esi
        
        ;outintln al
        ;outintln bl
        
        mov y[esi], 0
        add y[esi], al
        add y[esi], bl
        dec ecx
        cmp ecx, 0
        ja iny
    
    inint k
    mov al, k
    mov ecx, n
    mov esi, 1
    
    calcl:
        mov bl, byte ptr y[esi]
        cmp al, bl
        ja above
        jbe finish
    
    above:
        inc esi
        dec ecx
        cmp ecx, 0
        ja calcl
        je finish
    
    finish:
    mov l, esi
    outintln l

    exit
end start
