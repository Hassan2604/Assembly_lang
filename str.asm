dosseg
.model small
.stack 100h
.data
dosseg
.model small
.stack 100h
.data
var1 db 'Hello', 0Ah,'$'
var2 db 'World' ,0Ah,'$'
.code
main proc
mov ax, @data
mov ds, ax
mov dx, offset var1
mov ah, 9
int 21h
mov dx, offset var2
mov ah, 9
int 21h
mov ah, 4Ch
int 21h
main endp
end main
