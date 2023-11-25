dosseg
.model small
.stack 100h
.data
.code
main proc
mov cx,10
mov dx,43
l1:
mov ah,2
int 21h
add dx,1
loop l1
main endp
end main