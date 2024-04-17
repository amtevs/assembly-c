#include <stdio.h>
#include <stdlib.h>

int main(){
    int n, m;
    scanf("%d", &n);
    scanf("%d", &m);
    int* array[n];
    int* trans[m];

    for (int i = 0; i < n; i++) {
        array[i] = (int*)malloc(m * sizeof(int));
        for (int j = 0; j < m; j ++) {
            scanf("%d", &array[i][j]);
        }
    }
    
    for (int i = 0; i < m; i++) {
        trans[i] = (int*)malloc(n * sizeof(int));
        for (int j = 0; j < n; j++) {
            trans[i][j] = array[j][i];
        }
    }

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("%d ", trans[i][j]);
        }
        printf("\n");
    }

    for (int i = 0; i < n; i++) {
        free(array[i]);
    }
    for (int i = 0; i < m; i++) {
        free(trans[i]);
    }

    return 0;
}