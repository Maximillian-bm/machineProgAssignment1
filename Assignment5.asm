.orig x3000

; This is the loop for en checking of prime numbers with input and output in the console.
SOP
JSR     readS
JSR     isPrime
JSR     resultS
; When the result has been shown, we want to loop back to the start.
JSR     SOP

; ***** Read a 2 digit decimal number from the console. *****
readS   ST R1, save1
        ST R2, save2
        ST R3, save3
        AND R3, R3, #0
        ADD R3, R3, #-16
        ADD R3, R3, #-16
        ADD R3, R3, #-16
        LEA R0, output
        PUTS
read    GETC
        OUT
        ADD R0, R0, R3
        AND R2, R2, #0
        ADD R2, R2, #10
        AND R1, R1, #0
loop    ADD R1, R1, R0
        ADD R2, R2, #-1
        BRp loop
        GETC
        OUT
        ADD R0, R0, R3
        ADD R0, R0, R1
output  .stringz "\nInput a 2 digit decimal number: "
        LD R1, save1
        LD R2, save2
        LD R3, save3
        RET
save1   .BLKW 1
save2   .BLKW 1
save3   .BLKW 1

; ***** Check if number is prime. *****
isPrime ST R1, save4
        ST R2, save5
        ST R3, save6
        ST R4, save7
        ST R5, save8
        ADD R1, R0, #0
        AND R5, R5, #0
loop1   ADD R5, R5, #1
        ADD R1, R1, #-2
        BRzp loop1
        ADD R1, R5, #0
loop2   ADD R1, R1, #-1
        ADD R3, R1, #-1
        BRnz is
        ADD R2, R0, #0
        ADD R4, R1, #0
        NOT R4, R4
        ADD R4, R4, #1
        ADD R2, R2, R4
loop3   ADD R2, R2, R4
        BRp loop3
        BRn loop2
        AND R0, R0, #0
        BR done
is      AND R0, R0, #0
        ADD R0, R0, #1
done    LD R1, save4
        LD R2, save5
        LD R3, save6
        LD R4, save7
        LD R5, save8
        RET
save4   .BLKW 1
save5   .BLKW 1
save6   .BLKW 1
save7   .BLKW 1
save8   .BLKW 1

; ***** Print to console whether or not the number was prime. *****
resultS     AND R1, R1, #0
            ADD R1, R0, #0
            BRp     resultP
            BR      resultNP
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