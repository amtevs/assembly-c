#include <stdio.h>

void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}

int main(){
    int x, y;
    scanf("%d", &x);
    scanf("%d", &y);
    swap(&x, &y);
    printf("%d ", x);
    printf("%d", y);
    return 0;
}