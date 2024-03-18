.orig x3000
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
.end