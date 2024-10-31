# Variables
ASM = nasm
LD = ld
ASM_FLAGS = -f elf32
LD_FLAGS = -m elf_i386 -s

# Target: hello (the final executable)

# Target: hello.o (the object file)
prog01.o: prog01.asm
	$(ASM) $(ASM_FLAGS) prog01.asm -o prog01.o
prog01: prog01.o
	$(LD) $(LD_FLAGS) -o prog01 prog01.o

# Clean up generated files
clean:
	rm -f prog01 prog01.o
