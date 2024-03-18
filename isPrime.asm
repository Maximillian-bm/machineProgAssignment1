.orig x3000
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
save1   .BLKW 1
save2   .BLKW 1
save3   .BLKW 1
save4   .BLKW 1
save5   .BLKW 1
.end