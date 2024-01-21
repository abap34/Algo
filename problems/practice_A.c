#include <stdio.h>

void greed(int * p){
    printf("this is pointer! \n");
    printf("=======\n ");
}


void greed2(int x){
    printf("this is int! \n");
     printf("=======\n ");
}


int main(){
    int a;
    greed2(a);
    int *p;
    greed2(p);
    p = &a;
    greed2(p);
    p = 10;
    greed2(p);
}