#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <time.h>

int *array;        
int sum = 0;        
pthread_mutex_t mutex; 

int partSize;
int threadId[4];  

void* sumArrayPart(void* arg) {
    int id = *(int*)arg;
    int start = id * partSize;
    int end = (id == 3) ? partSize * 4 + partSize % 4 : (id + 1) * partSize;
    int localSum = 0;

    for (int i = start; i < end; i++) {
        localSum += array[i];
    }
    pthread_mutex_lock(&mutex);
    sum += localSum;
    pthread_mutex_unlock(&mutex);
    return NULL;
}

int main() {
    int N;
    scanf("%d", &N);

    if (N < 16) {
        return 1;
    }

    array = (int*)malloc(N * sizeof(int));
    srand(time(NULL));
    for (int i = 0; i < N; i++) {
        array[i] = rand() % 100; 
    }

    for (int i = 0; i < N; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");


    pthread_mutex_init(&mutex, NULL);
    pthread_t threads[4];
    partSize = N / 4;

    for (int i = 0; i < 4; i++) {
        threadId[i] = i;
        pthread_create(&threads[i], NULL, sumArrayPart, &threadId[i]);
    }

    for (int i = 0; i < 4; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("%d\n", sum);

    pthread_mutex_destroy(&mutex);
    free(array);

    return 0;
}
