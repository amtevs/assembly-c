#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
   int i;
   int sleep_time = atoi(argv[1]);
   int pid = getpid();
   for (i = 0;; i++) {
       sleep(sleep_time);
       printf("%d: %d\n", pid, i);
   }
   return 0;
}