#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>
#include <string.h>
#include <wait.h>

const char *sig_names[30] = {
    "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "BUS", "FPE", "KILL", "USR1", 
    "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT",
    "CHLD", "CONT", "STOP", "TSTP", "TTIN", 
    "TTOU", "URG", "XCPU", "XFSZ", "VTALRM", "PROF", "WINCH", "POLL", "PWR SYS"
};

volatile sig_atomic_t signal_count = 0;

void handler(int sig) {
    printf("%s\n", strsignal(sig));
}

void exit_handler(int sig) {
    signal_count++;
    if (signal_count >= 3) {
        exit(0);
    }
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        exit(EXIT_FAILURE);
    }
    int sleep_time = atoi(argv[1]);
    if (sleep_time <= 0) {
        exit(EXIT_FAILURE);
    }
    int exit_signal = -1;
    for (int j = 0; j < 30; j++) {
        if (strcmp(argv[2], sig_names[j]) == 0) {
            exit_signal = j + 1;
            break;
        }
    }
    if (exit_signal == -1) {
        exit(EXIT_FAILURE);
    }
    pid_t pid = fork();
    if (pid < 0) {
        perror("fork");
        exit(EXIT_FAILURE);
    }
    if (pid == 0) { 
        if (signal(exit_signal, exit_handler) == SIG_ERR) {
            perror("signal");
            exit(EXIT_FAILURE);
        }

        for (int i = 3; i < argc; i++) {
            for (int j = 0; j < 30; j++) {
                if (strcmp(argv[i], sig_names[j]) == 0) {
                    if (signal(j + 1, handler) == SIG_ERR) {
                        perror("signal");
                        exit(EXIT_FAILURE);
                    }
                    break;
                }
            }
        }

        for (int k = 0;; k++) {
            sleep(sleep_time);
            printf("%d: %d\n", getpid(), k);
            fflush(stdout); 
        }
    } else { 
        printf("Forking a child: %d\n", pid);

        int stat;
        if (wait(&stat) == -1) {
            perror("wait");
            exit(EXIT_FAILURE);
        }

        printf("And finally…\n");
        if (WIFSIGNALED(stat)) {
            psignal(WTERMSIG(stat), "Terminated:");
        }
        printf("Exit status: %d\n", stat);
    }

    return 0;
}
