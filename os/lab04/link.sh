gcc -c fred.c john.c
gcc -c -Wall -fPIC sam.c bill.c
gcc -shared -o libbs.so sam.o bill.o
ar crv libfd.a john.o fred.o
gcc -DLINKTIME -c fj.c
gcc -DRUNTIME -c bs.c
gcc -c program.c
 gcc -Wall -Wl,--wrap,fred -Wl,--wrap,john -o program program.o fj.o bs.o -lbs -lfd -L.
 export LD_LIBRARY_PATH=.
 ./program
 mv Makefile Makefile1
 
 