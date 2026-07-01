ASM=nasm
LD=ld

SRC=$(wildcard *.asm)
OBJ=$(SRC:.asm=.o)

init: $(OBJ)
	$(LD) -o $@ $(OBJ)

%.o: %.asm
	$(ASM) -f elf64 -g -F dwarf $< -o $@

clean:
	rm -f *.o programa
