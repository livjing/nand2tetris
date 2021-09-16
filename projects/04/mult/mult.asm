// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// m * n 换算成 n 个 m 相加
// 3 * 2
// 2 - 1 = 1  >= 0 : 0 + 3 = 3
// 1 - 1 = 0  >= 0 : 3 + 3 = 6
// 0 - 1 = -1 <  0 : JMP END


// Put your code here.
    @2
    M = 0  // R2 = 0

    @0
    D = M   // D = R0 
    
    @END
    D;JLT  // if R0 < 0 JMP END

(LOOP)
    @1
    M = M - 1 // R1 -= 1
    D = M     // D = R1
    @END
    D;JLT  // if R1 < 0 JMP END

    @0
    D = M   // D = R0
    @2
    M = M + D  // R2 += R0

    @LOOP
    0;JMP    

(END)
    @END
    0;JMP