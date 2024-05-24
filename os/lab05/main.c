#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>

#define INITIAL_BUFFER_SIZE 1024

void replace_text(const char *regex_pattern, const char *text, const char *replacement) {
    regex_t regex;
    regmatch_t match;
    size_t buffer_size = INITIAL_BUFFER_SIZE;
    size_t text_len = strlen(text);
    size_t replacement_len = strlen(replacement);
    size_t result_len = 0;

    char *result = (char *)malloc(buffer_size);
    if (result == NULL) {
        perror("malloc");
        exit(EXIT_FAILURE);
    }

    if (regcomp(&regex, regex_pattern, REG_EXTENDED) != 0) {
        fprintf(stderr, "regex\n");
        exit(EXIT_FAILURE);
    }

    const char *current_pos = text;
    while (regexec(&regex, current_pos, 1, &match, 0) == 0) {
        while (result_len + match.rm_so + replacement_len >= buffer_size) {
            buffer_size *= 2;
            result = (char *)realloc(result, buffer_size);
            if (result == NULL) {
                perror("realloc");
                exit(EXIT_FAILURE);
            }
        }

        memcpy(result + result_len, current_pos, match.rm_so);
        result_len += match.rm_so;

        memcpy(result + result_len, replacement, replacement_len);
        result_len += replacement_len;

        current_pos += match.rm_eo;
    }

    size_t remaining_len = text_len - (current_pos - text);
    while (result_len + remaining_len >= buffer_size) {
        buffer_size *= 2;
        result = (char *)realloc(result, buffer_size);
        if (result == NULL) {
            perror("realloc");
            exit(EXIT_FAILURE);
        }
    }
    memcpy(result + result_len, current_pos, remaining_len);
    result_len += remaining_len;

    result[result_len] = '\0';

    regfree(&regex);

    printf("Result: %s\n", result);
    
    free(result);
}

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <regex> <text> <replacement>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *regex_pattern = argv[1];
    const char *text = argv[2];
    const char *replacement = argv[3];

    replace_text(regex_pattern, text, replacement);

    return EXIT_SUCCESS;
}
