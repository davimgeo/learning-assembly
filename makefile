SRC = hello

run:
	nasm -felf64 $(SRC).asm
	ld $(SRC).o
	./a.out
