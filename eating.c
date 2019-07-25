#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
sem_t s[5];
void *eating(void *arg)
{
	int i=(int) arg;
	sem_wait(&s[i]);
	sem_wait(&s[(i+1)%5]);
	printf("\n%d is eating ",i);
	sleep(1);
	printf("\n%d eating is completed",i);
	sem_post(&s[(i+1)%5]);
	sem_post(&s[i]);
}
int main(int argc, char const *argv[])
{
	for(int i=0;i<5;i++)
	sem_init(&s[i],0,1);
	

	pthread_t p[5];
	for(int i=0;i<5;i++){
	pthread_create(&p[i], NULL, eating,i);
	}
	for(int i=0;i<5;i++){
	pthread_join(p[i], NULL);
	}
	return 0;
}