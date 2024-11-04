# Variables
ASM = nasm
LD = ld
ASM_FLAGS = -f elf32 -g -F dwarf     # Add debug flags for NASM
LD_FLAGS = -m elf_i386               # No need for '-s', as it strips symbols (removes debug info)
LST_FLAGS = -f elf32 -g -F dwarf     # Add debug flags for the listing file

# Target: prog04 (the final executable)
prog04: prog04.o
	$(LD) $(LD_FLAGS) -o prog04 prog04.o

# Target: prog04.o (the object file)
prog04.o: prog04.asm prog04.lst
	$(ASM) $(ASM_FLAGS) prog04.asm -o prog04.o

# Target: prog04.lst (the listing file)
prog04.lst: prog04.asm
	$(ASM) $(LST_FLAGS) -l prog04.lst prog04.asm

# Clean up generated files
clean:
	rm -f prog04 prog04.o prog04.lst
