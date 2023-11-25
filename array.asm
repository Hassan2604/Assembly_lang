.model small
.stack 100h
.data
    array db 5 dup(?) ; Declare an array to store five values
    msg db 'Enter a number: $' ; Message to prompt the user
    newline db 13, 10, '$' ; Newline character (carriage return and line feed)

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, 5 ; Set the loop counter to 5

    mov si, 0 ; Initialize index for array

input_loop:
    lea dx, msg ; Load address of the message
    mov ah, 09h ; DOS function to print a string
    int 21h ; DOS interrupt to print the message

    mov ah, 01h ; Function to read a character from standard input
    int 21h ; DOS interrupt to read a character

    sub al, '0' ; Convert ASCII character to integer
    mov [array + si], al ; Store the integer in the array

    inc si ; Move to the next index in the array

    loop input_loop ; Repeat the loop until cx becomes zero

    ; Display the array on new lines
    mov cx, 5 ; Reset the loop counter
    mov si, 0 ; Reset the array index

output_loop:
    mov al, [array + si] ; Load the value from the array
    add al, '0' ; Convert the integer to ASCII character

    mov ah, 02h ; DOS function to print a character to standard output
    int 21h ; DOS interrupt to print the character

    lea dx, newline ; Load address of the newline character
    mov ah, 09h ; DOS function to print a string
    int 21h ; DOS interrupt to print the newline

    inc si ; Move to the next index in the array

    loop output_loop ; Repeat the loop until cx becomes zero

    ; Exit the program
    mov ah, 4Ch ; DOS function to terminate program
    int 21h ; DOS interrupt to terminate program

end main
