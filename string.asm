dosseg
.model small
.stack 100h
.data
    var db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    mov si, offset var
l1:
    mov ah, 1
    int 21h
    cmp al, 13
    jne l2 ; Use jne (jump if not equal) instead of jl
    mov byte ptr [si], '$' ; Null-terminate the string
    jmp programend ; Jump to the end of the program
l2: 
    mov byte ptr [si], al
    inc si
    jmp l1
programend:
    mov dx, offset var
    mov ah, 9
    int 21h
    mov ah, 4Ch
    int 21h
main endp
end main