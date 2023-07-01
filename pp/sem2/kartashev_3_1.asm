include C:\MASM614\include\console.inc

.data

x db ?
y db ?
z db ?

sum dw ?
dif dw ?

.code
start:
   inint x
   inint y
   inint z
   
   xor bx, bx
   xor cx, cx
   xor dx, dx
   
   mov bl, x
   mov cl, y
   mov dl, z
   
   jmp start_a
   
start_a:
   xor ax, ax
   mov ax, 0h
   jmp check1_x

check1_x:
   bt bx, 7
   jc neg1_x
   
pos1_x:
   ;outstr 'pos_x '
   add al, bl
   adc ah, 0
   jmp check1_y

neg1_x:
   ;outstr 'neg_x '
   neg bl
   sub al, bl
   sbb ah, 0
   neg bl
   jmp check1_y
   
check1_y:
   bt cx, 7
   jc neg1_y
   
pos1_y:
   ;outstr 'pos_y '
   add al, cl
   adc ah, 0
   jmp check1_z

neg1_y:
   ;outstr 'neg_y '
   neg cl
   sub al, cl
   sbb ah, 0
   neg cl
   jmp check1_z
   
check1_z:
   bt dx, 7
   jc neg1_z
   
pos1_z:
   ;outstr 'pos_z '
   add al, dl
   adc ah, 0
   jmp to_sum1

neg1_z:
   ;outstr 'neg_z '
   neg dl
   sub al, dl
   sbb ah, dh
   neg dl
   jmp to_sum1

to_sum1:
   mov sum, ax
   jmp a_output

a_output:
   outstr 'a) '
   outword sum
   outchar ' '
   outint sum
   outcharln ' '
   jmp start_b
   
start_b:
   xor ax, ax
   mov ax, 0h
   jmp check2_x

check2_x:
   bt bx, 7
   jc neg2_x
   
pos2_x:
   ;outstr 'pos_x '
   add ax, bx
   jmp check2_y

neg2_x:
   ;outstr 'neg_x '
   neg bl
   sub ax, bx
   neg bl
   jmp check2_y
   
check2_y:
   bt cx, 7
   jc neg2_y
   
pos2_y:
   ;outstr 'pos_y '
   add ax, cx
   jmp check2_z

neg2_y:
   ;outstr 'neg_y '
   neg cl
   sub ax, cx
   neg cl
   jmp check2_z
   
check2_z:
   bt dx, 7
   jc neg2_z
   
pos2_z:
   ;outstr 'pos_z '
   add ax, dx
   jmp to_sum2

neg2_z:
   ;outstr 'neg_z '
   neg dl
   sub ax, dx
   neg dl
   jmp to_sum2

to_sum2:
   mov sum, ax
   jmp b_output

b_output:
   outstr 'b) '
   outword sum
   outchar ' '
   outint sum
   outcharln ' '
   jmp start_c
   
start_c:
   xor ax, ax
   mov ax, 0h
   jmp check3_z
   
check3_z:
   bt dx, 7
   jc neg3_z
   
pos3_z:
   ;outstr 'pos_z '
   add al, dl
   adc ah, 0
   jmp check3_y

neg3_z:
   ;outstr 'neg_z '
   neg dl
   sub al, dl
   sbb ah, 0
   neg dl
   jmp check3_y
   
check3_y:
   bt cx, 7
   jc neg3_y
   
pos3_y:
   ;outstr 'pos_y '
   sub al, cl
   sbb ah, 0
   jmp check3_x

neg3_y:
   ;outstr 'neg_y '
   neg cl
   add al, cl
   adc ah, 0
   neg cl
   jmp check3_x
   
check3_x:
   bt bx, 7
   jc neg3_x
   
pos3_x:
   ;outstr 'pos_y '
   sub al, bl
   sbb ah, 0
   jmp to_dif3

neg3_x:
   ;outstr 'neg_y '
   neg bl
   add al, bl
   adc ah, 0
   neg bl
   jmp to_dif3
   
to_dif3:
   mov dif, ax
   jmp c_output

c_output:
   outstr 'c) '
   outword dif
   outchar ' '
   outint dif
   outcharln ' '
   jmp start_d
   
start_d:
   xor eax, eax
   mov ax, 0h
   cwde
   
   xor ebx, ebx
   xor ecx, ecx
   xor edx, edx
   
   mov bl, x
   cbw
   cwde
   
   mov cl, y
   cbw
   cwde
   
   mov dl, z
   cbw
   cwde
   
   add eax, edx
   sub eax, ecx
   sub eax, ebx
   
   outstr 'd) '
   outword eax
   outchar ' '
   outint eax
   outcharln ' '
   
   exit
end start
