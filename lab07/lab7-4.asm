%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите а: ',0h
msg3 db 'f(x) = ',0h
section .bss
X resb 10
A resb 10
result resb 10
section .text
global _start
_start:
; ---------- Вывод сообщения 'Введите x: '
mov eax,msg1
call sprint
; ---------- Ввод 'X'
mov ecx,X
mov edx,10
call sread
; ---------- Преобразование 'x' из символа в число
mov eax,X
call atoi ; Вызов подпрограммы перевода символа в число
mov [X],eax ; запись преобразованного числа в 'X'
; ---------- Вывод сообщения 'Введите A: '
mov eax,msg2
call sprint
; ---------- Ввод 'A'
mov ecx,A
mov edx,10
call sread
; ---------- Преобразование 'A' из символа в число
mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа в 'A'
; ---------- Сравниваем x и a для получения формулы для вычисления
mov eax,[X]
mov ebx,[A]
cmp eax,ebx
jl sekond_var ; Если х < а, то перейти к 3*а+1
; ---------- Вычисление 3*х+1
imul eax,eax,3 ; eax = 3*x
add eax,1 ; eax = 3*x+1
jmp result_f
sekond_var:
; ---------- Вычисление 3*а+1
mov eax,[A] ; eax = a
imul eax,eax,3 ; eax = 3*a+1
add eax,1
result_f:
mov [result],eax
; ---------- Вывод результата
fin:
mov eax,msg3
call sprint ; выыод 'f(x) = '
mov eax,[result]
call iprintLF ; Вывод [result]
call quit
