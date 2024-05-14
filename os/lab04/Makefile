program: program.o libbs.so libfd.a bs.o fj.o
	gcc -Wall -Wl,--wrap,fred -Wl,--wrap,john -o program program.o fj.o bs.o -lbs -lfj -L.
bill.o:
	gcc -c -Wall -fPIC bill.c
sam.o:
	gcc -c -Wall -fPIC sam.c
fred.o:
	gcc -c fred.c
john.o:
	gcc -c john.c
program.o:
	gcc -c program.c
libbs.so: bill.o sam.o
	gcc -shared -o libbs.so bill.o sam.o
libfd.a: fred.o john.o
	ar crv libfd.a fred.o john.o
bs.o:
	gcc -DRUNTIME -c bs.c
fj.o:
	gcc -DLINKTIME -c fj.c
