#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <string.h>
 
const char* sig_names[30] = {
    "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "BUS", "FPE", "KILL", "USR1", 
    "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT",
    "CHLD", "CONT", "STOP", "TSTP", "TTIN", 
    "TTOU", "URG", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "POLL", "PWR SYS"
};

void handler(int sig) {
    printf("%s", strsignal(sig));
}

int main(int argc, char *argv[]) {
   int i;
   int sleep_time = atoi(argv[1]);
   int hand_count = atoi(argv[2]);
   for(int i = 0; i < hand_count; i++) {
        for(int j = 0; j < 30; j++) {
            if(!strcmp(argv[i + 3], sig_names[j])) {
                signal(j + 1, handler);
            }
        }
   }
   int pid = getpid();
   for (i = 0;; i++) {
       sleep(sleep_time);
       printf("%d: %d\n", pid, i);
   }
   return 0;
}