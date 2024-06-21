#include <stdio.h>
#include <wait.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
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

void exit_handler(int sig) {
    exit(0);
}

int main(int argc, char *argv[]) {
    int stat;
    pid_t pid;
    int sleep_time = atoi(argv[1]);
    if ((pid = fork()) == 0) {
        for(int j = 0; j < 30; j++) {
            if(!strcmp(argv[2], sig_names[j])) {
                signal(j + 1, exit_handler);
            }
        }
        for(int i = 3; i < argc; i++) {
            for(int j = 0; j < 30; j++) {
                if(!strcmp(argv[i], sig_names[j])) {
                    signal(j + 1, handler);
                }
            }
        }
        for (int k = 0;; k++) {
            sleep(sleep_time);
            printf("%d: %d\n", pid, k);
        }
    } else {
        printf("Forking a child: %d\n", pid);
        wait(&stat);
        printf("And finally…\n");

        if (WIFSIGNALED(stat)) {
            psignal(WTERMSIG(stat), "Terminated:");
        }
        printf("Exit status: %d\n", stat);
    }
    return 0;
}