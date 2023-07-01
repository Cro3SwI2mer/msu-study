include C:\MASM614\include\console.inc

time struc ; время какого-то момента суток
    h DB ? ; час (от 0 до 23)
    m DB ? ; минута (от 0 до 59)
    s DB ? ; секунда (от 0 до 59)
time ends

.data

t time <,,>
t1 time <,,>  

.code

start:
    
    inint al
    cmp al, 0
    jl wrong_hours
    cmp al, 23
    jg wrong_hours
    mov t.h, al
    
    inint al
    cmp al, 0
    jl wrong_minutes
    cmp al, 59
    jg wrong_minutes
    mov t.m, al
    
    inint al
    cmp al, 0
    jl wrong_seconds
    cmp al, 59
    jg wrong_seconds
    mov t.s, al
    
    jmp next
    
    wrong_hours:
        outstrln 'Wrong hours input!'
        jmp ee
    
    wrong_minutes:
        outstrln 'Wrong minutes input!'
        jmp ee
    
    wrong_seconds:
        outstrln 'Wrong seconds input!'
        jmp ee
        
    next:
        mov al, t.s
        add al, 1
        cmp al, 60
        je ts
        jmp nots
    
    ts:
        mov t1.s, 0
        mov al, t.m
        add al, 1
        cmp al, 60
        je tm
        jmp notm
        
    tm:
        mov t1.m, 0
        mov al, t.h
        add al, 1
        cmp al, 24
        je th
        jmp noth
        
    th:
        mov t1.h, 0
        mov al, 1
        jmp ee
        
    nots:
        mov t1.s, al
        mov bl, t.m
        mov t1.m, bl
        mov bl, t.h
        mov t1.h, bl
        mov al, 0
        jmp ee
    
    notm:
        mov t1.m, al
        mov bl, t.h
        mov t1.h, bl
        mov al, 0
        jmp ee
        
    noth:
        mov t1.h, al
        mov al, 0
        jmp ee
        
    ee:
        outstr 'Old time: '
        outint t.h
        outchar ':'
        outint t.m
        outchar ':'
        outintln t.s
        
        outstr 'New time: '
        outint t1.h
        outchar ':'
        outint t1.m
        outchar ':'
        outintln t1.s
        
        cmp al, 0
        jg nds
        jmp fe
        
        nds:
            outstrln 'New day started!'
        
        fe:
        
        exit
end start
