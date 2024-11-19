%include 'in_out.asm'
section .data
msg1 db 'Наименьшая переменная: ',0h
A dd '81'
B dd '22'
C dd '72'
section .bss
min resb 10
section .text
global _start
_start:
; ---------- Преобразуем переменные из символов в числа
mov eax,B
call atoi ; Вызов подпрограммы перевода символа в число
mov [B],eax ; запись преобразованного числа в 'B'
mov eax,C
call atoi ; Вызов подпрограммы перевода символа в число
mov [C],eax ; запись преобразованного числа в 'C'
mov eax,A
call atoi ; Вызов подпрограммы перевода символа в число
mov [A],eax ; запись преобразованного числа в 'A'
; ---------- Записываем C в переменную min
mov ecx,[C]
mov [min],ecx
; ---------- Сравниваем 'C' и 'A'
cmp ecx,[A] ; Сравниваем 'C' и 'A'
jle check_B; если 'C<=A', то переход на метку 'check_B',
mov ecx,[A]
mov [min],ecx ; иначе 'min = A' То есть 'A' меньше
check_B:
; ---------- Сравниваем 'min(A,C)' и 'B'
cmp ecx,[B] ; Сравниваем 'min(A,C)' и 'B'
jle fin ; если 'min(A,C)<B', то переход на 'fin',
mov ecx,[B]
mov [min],ecx ; иначе 'min = B'
; ---------- Вывод результата
fin:
mov eax,msg1
call sprint ; Вывод сообщения 'Наименьшая переменная: '
mov eax,[min]
call iprintLF ; Вывод 'min(A,B,C)'
call quit ; Выход
