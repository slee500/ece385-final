#include <stdio.h> 
#include <string.h>

unsigned int inputToBin(char* c);
int main() {
    FILE *fp;

    fp = fopen("inputdata/trainingimages", "r");
    if (fp == NULL) {
        printf("Error opening file\n");
        return 0;
    }

    char myStr[28];
    long unsigned int count = 0;

    while (fgets(myStr, 99, fp) != NULL) {
        char i;
        unsigned int converted = inputToBin(myStr);
        char printStr[28];
        
        printf("%d <-- %s", converted, myStr);
        count++;
        
        if (count%28 == 0) {
            printf("\nTransmitted one number. Press enter to continue. ");
            getchar();
            printf("\n");
        }
    }

    printf("Hello world!\n");

    return 0;
}

unsigned int inputToBin(char* c) {
    unsigned int i, x=0, pow2=1;
    for (i=0; (c[i] == 48 || c[i] == 49); i++) {
        x = x << 1;
        if (c[i] == 49) { // we have '1'
            x += 1;
        }
    }
    return x;
}