include C:\MASM614\include\console.inc

.data

x dd ?
y dd ?

.code
start:
   inint x
   inint y
   
   outstrln 'Sum:'
   mov eax, x
   add eax, y
   
   outstr 'Unsighned: '
   outword eax
   outstrln ' '
   outstr 'Sighned: '
   outint eax
   outstrln ' '
   
   xor eax, eax
   
   outstrln 'Substraction:'
   mov eax, x
   sub eax, y
   
   outstr 'Unsighned: '
   outword eax
   outstrln ' '
   outstr 'Sighned: '
   outint eax
   outstrln ' '
   
   exit
end start