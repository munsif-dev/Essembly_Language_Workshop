# Variables
ASM = nasm
ASMFLAGS = -f elf32
LD = ld
LDFLAGS = -m elf_i386 -s
TARGET = Prog01
SRC = prog01.asm
OBJ = prog01.o

# Default target
all: $(TARGET)

# Build the executable
$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)

# Assemble the assembly file into an object file
$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

# Clean up the build files
clean:
	rm -f $(OBJ) $(TARGET)


