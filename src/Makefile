SRC = retro_breakout.asm
OBJ = retro_breakout.o
OUT = retro_breakout

all: $(OUT)

$(OUT): $(OBJ)
	ld -m elf_x86_64 -o $(OUT) $(OBJ)

$(OBJ): $(SRC)
	nasm -f elf64 -o $(OBJ) $(SRC)

clean:
	rm -f $(OBJ) $(OUT)
