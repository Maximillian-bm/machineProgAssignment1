.orig x3000
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
output  .stringz "Input a 2 digit decimal number:" 
        LD R1, save1
        LD R2, save2
        LD R3, save3
        RET
save1   .BLKW 1
save2   .BLKW 1
save3   .BLKW 1
.end