#include<stdio.h>
#include<pthread.h>
#include<semaphore.h>
int buff[10];
pthread_mutex_t m;
sem_t n,e;
void *producer(void *arg)
{
	int i=0;
	while(1)
	{
		sem_wait(&e);
		pthread_mutex_lock(&m);
		buff[i]=random()%10;
		printf("\nNumber %d is added at %d",buff[i],i);
		i++;
		pthread_mutex_unlock(&m);
		if(i==10)i=0;
		sleep(1);
		sem_post(&n);
	}
}
void *consumer(void *arg)
{
	int i=0;
	while(1)
	{
		sem_wait(&n);
		pthread_mutex_lock(&m);
		printf("\nnumber %d is extracted from %d",buff[i],i);
		i++;
		pthread_mutex_unlock(&m);
		if(i==10)i=0;
		sleep(1);
		
	}
}
int main(){
  pthread_t pid,cid;
  pthread_mutex_init(&m,NULL);
  sem_init(&n,0,0);
  sem_init(&e,0,10);
  pthread_create(&pid,NULL,producer,NULL);
  pthread_create(&cid,NULL,consumer,NULL);
  pthread_join(pid,NULL);
  pthread_join(cid,NULL);
  
}


