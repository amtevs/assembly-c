#include <stdio.h>
#include <sys/types.h>
#include <signal.h>
#include <stdlib.h>
#include <string.h>

const char* sig_names[30] = {
    "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "BUS", "FPE", "KILL", "USR1", 
    "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT",
    "CHLD", "CONT", "STOP", "TSTP", "TTIN", 
    "TTOU", "URG", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "POLL", "PWR SYS"
};

int main(int argc, char *argv[]) {
    for(int i = 0; i < 30; i++) {
        if(!strcmp(argv[2], sig_names[i])) {
            if (kill(atoi(argv[1]), i + 1)) {
                perror("Failed to kill");
                return 0;
            }
        }
    }
    printf("No such signal\n");
    return 0;
}