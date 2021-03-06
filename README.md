> **This design is behavioral and not for synthesis.**

> **For synthesizable and more efficient design contact me.**

# 8-bit-Harvard-Processor
Designing a 8-bit processor using Verilog



* 32-numbers of 8-bit registers.
* 8-bit logic and unsigned fixed point arithmetic circuit.
* Load and Store unit.
* Data memory with 256 numbers of 8-bit locations.
* 32-bit Instructions.
* Instruction memory with 64 numbers of 32-bit locations.
* 6-bit Program Counter.




| Opcode  |  Description                       |      Usage                         |                Operation                        |
|  ----   |    :------------------------:      |      :--------------------------:  |    ---------------------------------------:     |
| 000000  |  Immediate move                    |  MVI Rdst, Imm value               |  Rdst = Imm value                               |
| 000001  |  Register move                     |  MOV Rdst, Rsrc                    |  Rdst = Rsrc                                    | 
| 000010  |  Load                              |  LOAD Rdst, Src address            |  Rdst = @[Src address]                          |
| 000011  |  Store                             |  STORE Dst address,Rsrc            |  @[Dst address] = Rsrc                          |
| 000100  |  16-bit fixed point addition       |  ADD Rdst1, Rsrc2, Rsrc1           |  Rdst1 = Rsrc2 + Rsrc1                          |     
| 000101  |  16-bit fixed point subtraction    |  SUB Rdst1, Rsrc2, Rsrc1           |  Rdst1 = Rsrc2 − Rsrc1                          |
| 000110  |  16-bit fixed point negation       |  NEG Rdst1, Rsrc1                  |  Rdst1 = −Rsrc1                                 |
| 000111  |  16-bit fixed point multiplication |  MUL Rdst2, Rdst1, Rsrc2, Rsrc1    |  {Rdst2, Rdst1} = Rsrc2 × Rsrc1                 |
| 001000  |  16-bit fixed point division       |  DIV Rdst1, Rsrc2, Rsrc1           |  Rdst1 = Rsrc2/Rsrc1                            |     
| 001001  |  16-bit Logical OR                 |  OR Rdst1, Rsrc2, Rsrc1            |  Rdst1 = Rsrc2 | Rsrc1                          |
| 001010  |  16-bit Logical XOR                |  XOR Rdst1, Rsrc2, Rsrc1           |  Rdst1 = Rsrc2 (xor) Rsrc1                      |
| 001011  |  16-bit Logical NAND               |  NAND Rdst1, Rsrc2, Rsrc1          |  Rdst1 = Rsrc2 !& Rsrc1                         |
| 001100  |  16-bit Logical NOR                |  NOR Rdst1, Rsrc2, Rsrc1           |  Rdst1 = Rsrc2 !| Rsrc1                         |
| 001101  |  16-bit Logical NXOR               |  XNOR Rdst1, Rsrc2, Rsrc1          |  Rdst1 = Rsrc2 !(xor) Rsrc1                     |
| 001110  |  16-bit Logical NOT                |  NOT Rdst1, Rsrc1                  |  Rdst1 =!Rsrc1                                  |
| 001111  |  16-bit Logical left shift         |  LLSH Rdst1, Rsrc2, Rsrc1          |  Rdst1 = Rsrc2<<Rsrc1                           |
| 010000  |  16-bit Logical right shift        |  LRSH Rdst1, Rsrc2, Rsrc1          |  Rdst1 = Rsrc2 >> Rsrc1                         |

## Author
* Surya Teja 
* Mail - **heysuryateja@gmail.com**
* Connect on [Linkedin](https://www.linkedin.com/in/suryateja2000/)
