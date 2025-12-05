all:
		gcc -c -g -ggdb -o main.o main.c
		nasm -f elf64 -F dwarf -g func.asm -o func.o
		gcc -m64 -o func main.o func.o -g -ggdb -no-pie -z noexecstack
		./func