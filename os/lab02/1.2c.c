#include <stdio.h>
#include <stdlib.h>

int main(){
    int n;
    scanf("%d", &n);
    int* array = malloc(sizeof(int) * n);
    for (int i = 0; i < n; i++) {
        scanf("%d", &array[i]);
    }
    
    for (int i = 0; i < n/2; i++) {
        int c = array[i];
        array[i] = array[n - i - 1];
        array[n - i - 1] = c;
    }

    for (int i = 0; i < n; i++) {
        printf("%d ", array[i]);
    }
    free(array);
    return 0;
}