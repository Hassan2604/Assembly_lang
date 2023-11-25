.model small
.stack 100h
.data
    msg1 db "Enter first number: $"
    msg2 db "Enter second number: $"
    msg3 db "The sum is: $"
    num1 db ?
    num2 db ?
    sum db ?
.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    ; input first number
    mov ah, 01h
    int 21h
    sub al, '0'  ; convert ASCII to integer
    mov num1, al
    
    mov dx,10
    mov ah,2
    int 21h

    lea dx, msg2
    mov ah, 09h
    int 21h



    ; input second number
    mov ah, 01h
    int 21h
    sub al, '0'  ; convert ASCII to integer
    mov num2, al
    mov dx,10
    mov ah,2
    int 21h

    ; calculate sum
    mov al, num1
    add al, num2
    add al, '0'  ; convert integer to ASCII
    mov sum, al

    lea dx, msg3
    mov ah, 09h
    int 21h

   mov dx,10 ;to print new line
    mov ah,2
    int 21h

    ; output sum
    mov dl, sum
    mov ah, 02h
    int 21h

    ; exit the program
    mov ah, 4ch
    int 21h
main endp
end main
