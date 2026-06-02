NASM = nasm
LD = ld
CC = gcc

NASMFLAGS = -f elf64
CFLAGS = -O0

SRC_DIR = src
OBJ_DIR = obj

TARGET = loop

ASM = $(SRC_DIR)/$(TARGET).asm
OBJ = $(OBJ_DIR)/$(TARGET).o
BIN = $(TARGET)

run: $(BIN)
	./$(BIN)

$(BIN): $(OBJ)
	$(LD) $< -o $@

$(OBJ_DIR):
	mkdir -p $@

$(OBJ): $(ASM) | $(OBJ_DIR)
	$(NASM) $(NASMFLAGS) $< -o $@

disas:
	$(CC) $(CFLAGS) test.c -o a.out
	objdump -d -M intel a.out

clean:
	rm -f $(OBJ) $(BIN) a.out
