# Variables
ASM = nasm
LD = ld
ASM_FLAGS = -f elf32 -g -F dwarf     # Add debug flags for NASM
LD_FLAGS = -m elf_i386               # No need for '-s', as it strips symbols (removes debug info)
LST_FLAGS = -f elf32 -g -F dwarf     # Add debug flags for the listing file

# Target: prog03 (the final executable)
prog03: prog03.o
	$(LD) $(LD_FLAGS) -o prog03 prog03.o

# Target: prog03.o (the object file)
prog03.o: prog03.asm prog03.lst
	$(ASM) $(ASM_FLAGS) prog03.asm -o prog03.o

# Target: prog03.lst (the listing file)
prog03.lst: prog03.asm
	$(ASM) $(LST_FLAGS) -l prog03.lst prog03.asm

# Clean up generated files
clean:
	rm -f prog03 prog03.o prog03.lst
