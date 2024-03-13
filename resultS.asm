.orig x3000
resultS AND R0,R0, #0                       ;sets R0 to 0
        
result  ADD R0,R0, #1                       ;sets R0 to the given nr
        BRz resultZ
        BRnp resultNP 
        JSR     EOP                         ;this stops the program after the outprint


outputIs  .stringz "The number is prime"    ;this is the output string that resultZ is holding
resultZ LEA R0, outputIs                    ;sets the output
        PUTS                                ;prints its in console
        JSR     EOP                         ;this stops the program after the outprint

outputNot  .stringz "The number is not prime" ;this is the output string that resultNP is holding
resultNP LEA R0, outputNot                  ;sets the out output
        PUTS                                ;prints it in console 
        JSR     EOP                         ;this stops the program after the outprint
        
EOP 
.end                                    ;this labels .end with EOP(endOfProgram)