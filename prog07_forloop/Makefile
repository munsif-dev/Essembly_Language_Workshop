# Variables
ASM = nasm
ASMFLAGS = -f elf32
LD = ld
LDFLAGS = -m elf_i386 -s
TARGET = Prog07
SRC = prog07.asm
OBJ = prog07.o
DEBUGFILE = prog07.debug
DEBUGFLAGS = -g
ASMFLAGS += $(DEBUGFLAGS)
LDFLAGS += $(DEBUGFLAGS)

# Default target
all: $(TARGET) $(DEBUGFILE)

# Build the executable
$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $(TARGET) $(OBJ)

# Assemble the assembly file into an object file
$(OBJ): $(SRC)
	$(ASM) $(ASMFLAGS) $(SRC) -o $(OBJ)

# Generate the debug file
$(DEBUGFILE): $(OBJ)
	objdump -d -M intel $(OBJ) > $(DEBUGFILE)

# Clean up the build files
clean:
	rm -f $(OBJ) $(TARGET) $(DEBUGFILE)
