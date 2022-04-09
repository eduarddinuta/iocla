all: nr_neg_poz nr_odd_even

nr_neg_poz: nr_neg_poz.o
		gcc -m32 -o nr_neg_poz nr_neg_poz.o
nr_neg_poz.o: 
		nasm -f elf nr_neg_poz.asm
nr_odd_even: nr_odd_even.o
		gcc -m32 -o nr_odd_even nr_odd_even.o
nr_odd_even.o:
		nasm -f elf nr_odd_even.asm
clean: 
	rm -f nr_neg_poz nr_odd_even *.o
