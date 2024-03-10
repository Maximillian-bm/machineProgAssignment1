.orig x3000
isPrime ST R1, save1
        ST R2, save2
        ST R3, save3
        ST R4, save4
        ST R5, save5
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
done    LD R1, save1
        LD R2, save2
        LD R3, save3
        LD R4, save4
        LD R5, save5
        RET
save1   .BLKW 1
save2   .BLKW 1
save3   .BLKW 1
save4   .BLKW 1
save5   .BLKW 1
.end