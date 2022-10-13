# LittleComputer3_LC3
An assembly language for Computer Systems and Programming Languages Course (EE2009)
## Introduction
- Little Computer 3, or LC-3, is a type of computer educational programming language, an assembly language, which is a type of low-level programming language.

- It features a relatively simple instruction set, but can be used to write moderately complex assembly programs, and is a viable target for a C compiler. The language is less complex than x86 assembly but has many features similar to those in more complex languages. These features make it useful for beginning instruction, so it is most often used to teach fundamentals of programming and computer architecture to computer science and computer engineering students.

- The LC-3 was developed by Yale N. Patt at the University of Texas at Austin and Sanjay J. Patel at the University of Illinois at Urbana–Champaign. Their specification of the instruction set, the overall architecture of the LC-3, and a hardware implementation can be found in the second edition of their textbook.[1] Courses based on the LC-3 and Patt and Patel's book are offered in many computer engineering and computer science departments.
## Architecture
- The LC-3 specifies a word size of 16 bits for its registers and uses a 16-bit addressable memory with a 216-location address space. The register file contains eight registers, referred to by number as R0 through R7. All of the registers are general-purpose in that they may be freely used by any of the instructions that can write to the register file, but in some contexts (such as translating from C code to LC-3 assembly) some of the registers are used for special purposes.

- Instructions are 16 bits wide and have 4-bit opcodes. The instruction set defines instructions for fifteen of the sixteen possible opcodes, though some instructions have more than one mode of operation. Individual instructions' execution is regulated by a state machine implemented with a control ROM and microsequencing unit.

- The architecture supports the use of a keyboard and monitor to regulate input and output; this support is provided through memory mapped I/O abstractions. In simulation, these registers can be accessed directly, and the architectural specification describes their contents. Higher-level I/O support is also provided through the use of the TRAP instruction and a basic operating system. The operating system provides functions to read and echo characters from the keyboard, print individual characters to the monitor, print entire strings in both packed and unpacked forms, and halt the machine.

- All data in the LC-3 is assumed to be stored in a two's complement representation; there is no separate support for unsigned arithmetic. The I/O devices operate on ASCII characters. The LC-3 has no native support for floating-point numbers.
- Memory map: 

![alt text](https://github.com/LTPhat/LittleComputer3_LC3/blob/main/memory_map.png)

## Quick reference guides

![alt text](https://github.com/LTPhat/LittleComputer3_LC3/blob/main/reference_guide_1.png)

![alt text](https://github.com/LTPhat/LittleComputer3_LC3/blob/main/reference_guide_2.png)

![alt text](https://github.com/LTPhat/LittleComputer3_LC3/blob/main/reference_guide_3.png)

## References
[1] Little Computer 3, Wiki, https://en.wikipedia.org/wiki/Little_Computer_3.

[2] LC3 Assembly Manual Lab, https://people.cs.georgetown.edu/~squier/Teaching/HardwareFundamentals/LC3-trunk/docs/LC3-AssemblyManualAndExamples.pdf.
