all:
		nasm -f elf64 -F dwarf -g func.asm -o func.o
		nasm -f elf64 -F dwarf -g main.asm -o main.o
		nasm -f elf64 -F dwarf -g inout.asm -o inout.o
		gcc -m64 -o lab main.o func.o inout.o -g -ggdb -no-pie -z noexecstack
		./lab