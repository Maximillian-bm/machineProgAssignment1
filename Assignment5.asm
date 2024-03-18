.orig x3000

; This is the loop for en checking of prime numbers with input and output in the console.
SOP
JSR     readS
JSR     isPrime
JSR     resultS
; When the result has been shown, we want to loop back to the start.
JSR     SOP

; ***** Read a 2 digit decimal number from the console. *****
readS   ST R1, save1 ; Save the registeres values in memory
        ST R2, save2
        ST R3, save3
        AND R3, R3, #0 ; Set R3 to -48
        ADD R3, R3, #-16
        ADD R3, R3, #-16
        ADD R3, R3, #-16
        LEA R0, output ; Set R0 to be a pointer for the output string
        PUTS ; Print the string
read    GETC ; Read the next input
        OUT ; Echo the input back out
        ADD R0, R0, R3 ; Subtract 48 from the input to get the value
        AND R2, R2, #0 ; Set R2 to 10
        ADD R2, R2, #10 
        AND R1, R1, #0 ; Set R1 to 0
loop    ADD R1, R1, R0
        ADD R2, R2, #-1
        BRp loop ; Add the input value to R1 10 times
        GETC ; Get the next input
        OUT ; Echo the input back out
        ADD R0, R0, R3 ; Subtract 48 from the input to get the value
        ADD R0, R0, R1 ; Add the input times 10 to the new input
output  .stringz "Input a 2 digit decimal number:" 
        LD R1, save1 ; Restore the registeres values
        LD R2, save2
        LD R3, save3
        RET ; Return from subroutine
save1   .BLKW 1
save2   .BLKW 1
save3   .BLKW 1

; ***** Check if number is prime. *****
isPrime ST R1, save1 ; Save the value of registers to memory
        ST R2, save2
        ST R3, save3
        ST R4, save4
        ST R5, save5
        ADD R1, R0, #0 ; Set R1 equal to the agument
        AND R5, R5, #0 ; Set R5 to 0
loop1   ADD R5, R5, #1 ; Add 1 to R5
        ADD R1, R1, #-2 ; Subtract 2 from R1
        BRzp loop1 ; Repeat loop if R1 isnt negativ
        ADD R1, R5, #0 ; Set R1 equal to R5
loop2   ADD R1, R1, #-1 ; Subtract 1 from R1
        ADD R3, R1, #-1 ; Set R3 equal to R1 minus 1
        BRnz is ; If R3 is less than 1 jump to 'is'
        ADD R2, R0, #0 ; Set R2 equal to the agument
        ADD R4, R1, #0 ; Set R4 equal to R1
        NOT R4, R4
        ADD R4, R4, #1
        ADD R2, R2, R4 ; Subtract R4 from R2 outside loop3
loop3   ADD R2, R2, R4 ; Subtract R4 from R2 inside loop3
        BRp loop3 ; Repeat loop3 if R2 is posetiv
        BRn loop2 ; Repeat loop2 if R2 is negative
        AND R0, R0, #0 ; Set R0 to 0
        BR done ; Jump to 'done'
is      AND R0, R0, #0
        ADD R0, R0, #1 ; set R0 to 1
done    LD R1, save1 ; Restore the values of the registeres
        LD R2, save2
        LD R3, save3
        LD R4, save4
        LD R5, save5
        RET ; Return from subroutine
save4   .BLKW 1
save5   .BLKW 1
save6   .BLKW 1
save7   .BLKW 1
save8   .BLKW 1

; ***** Print to console whether or not the number was prime. *****
resultS     AND R1, R1, #0
            ADD R1, R0, #0
            BRz     resultNP
            BR      resultP
            RET

outputIs    .stringz "\nThe number is prime."       ; this is the output string that resultZ is holding
resultP     LEA R0, outputIs                        ; sets the output
            PUTS                                    ; prints its in console
            RET
outputNot   .stringz "\nThe number is not prime."   ; this is the output string that resultNP is holding
resultNP    LEA R0, outputNot                       ; sets the out output
            PUTS                                    ; prints it in console 
            RET
.end