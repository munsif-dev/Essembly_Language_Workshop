# Variables
ASM = nasm
LD = ld
ASM_FLAGS = -f elf32
LD_FLAGS = -m elf_i386 -s
LST_FLAGS = -f elf32 -l prog02.lst

# Target: prog02 (the final executable)
prog02: prog02.o
	$(LD) $(LD_FLAGS) -o prog02 prog02.o

# Target: prog02.o (the object file) and prog02.lst (the listing file)
prog02.o: prog02.asm prog02.lst
	$(ASM) $(ASM_FLAGS) prog02.asm -o prog02.o

# Target: prog02.lst (the listing file)
prog02.lst: prog02.asm
	$(ASM) $(LST_FLAGS) prog02.asm

# Clean up generated files
clean:
	rm -f prog02 prog02.o prog02.lst
