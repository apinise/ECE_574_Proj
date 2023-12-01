#include "main.h"

int decTapCoeff[BL];
int buffer[WAVE_SIZE];
int taps[BL];
unsigned int NUMTAPS = BL;

int float2q(float x, int f) {
    int output = (int)(x * (1 << f));
    return output;
}

float q2float(int x, int f) {
    float output = (x * 1.0f) / (1 << f);
    return output;
}

void q2bin(int binary) {
    const size_t BITS = 8*sizeof(binary);
    char bin_str[BITS+1];

    for (unsigned int i=0; i<BITS; i++) {
        unsigned int mask = 1u << (BITS - 1 - i);
        bin_str[i] = (binary & mask) ? '1' : '0';
    }

    bin_str[BITS] = '\0';
    printf("%s\n", bin_str);
}

void decCoeff(void){
    for (unsigned int i = 0; i < BL; i++) {
        decTapCoeff[i] = float2q(B[i], DECIMALS);
    }  
}

void writeCoeff(int size, char *File_Name) {
    FILE *fp = fopen(File_Name, "w"); 
    if (fp == NULL) { 
        printf("Failed to open file.\n"); 
    } 
 
    for (int i = 0; i < size; i++) { 
        fprintf(fp, "%d\n", decTapCoeff[i]); 
    } 
 
    fclose(fp); 
    printf("Data saved to file %s.\n", File_Name); 
}

void writeWave(int size, char *File_Name) {
    FILE *fp = fopen(File_Name, "w"); 
    if (fp == NULL) { 
        printf("Failed to open file.\n"); 
    } 
 
    for (int i = 0; i < size; i++) { 
        fprintf(fp, "%d\n", buffer[i]); 
    } 
 
    fclose(fp); 
    printf("Data saved to file %s.\n", File_Name); 
}

void waveGen(int freq, int samp) {
    srand((unsigned)time(NULL));
    for (int i = 0; i < WAVE_SIZE; i++) {
        //buffer[i] = float2q(2048 + 1024*sin(freq * (2 * PI) * i / samp), 0);
        buffer[i] = float2q(2048 + 1024*sin(freq * (2 * PI) * i / samp) + sqrt(0.0001) * rand(), 0);
    }
}

int processSampleDirect(int sample) {
    int q = 0;
    //int output = 0;
    //float input = q2float(sample, DECIMALS);
    taps[0] = sample;
    for (unsigned int i = 0; i<NUMTAPS; i++)
        q += taps[i] * decTapCoeff[i];
    for (unsigned int i = NUMTAPS-1; i>0; i--)
        taps[i] = taps[i-1];
    q = q >> DECIMALS;
    //output = float2q(q, DECIMALS);
    return q;
}

int processSampleTranspose(int sample) {
    int q = 0;
    //int output = 0;
    //float input = q2float(sample, DECIMALS);
    taps[0] = sample;
    for (unsigned int i = NUMTAPS - 1; i > 0; i--) {
        taps[i] = taps[i - 1];
        q += taps[i] * B[i];
    }
    q += taps[0] * B[0];
    //q = q >> 12;
    //output = float2q(q, DECIMALS);
    return q;
}

int processSampleTranspose2(int sample) {
    int q;
    for (unsigned int i = NUMTAPS - 1; i > 1; i--) {
        taps[i] = taps[i - 1] + (sample * decTapCoeff[NUMTAPS-i-1]);
    }

    taps[0] = sample * decTapCoeff[31];
    q = taps[31] >> DECIMALS;
    //output = float2q(q, DECIMALS);
    return q;
}

int main(void) {

    decCoeff();
    writeCoeff(BL, FILE_NAME);
    printf("Quantized Coefficients\n");
    for (unsigned int i = 0; i < BL; i++) {
        printf("%d\n", decTapCoeff[i]);
    }
    printf("Float Conversion\n");
    for (unsigned int i = 0; i < BL; i++) {
        printf("%f\n", q2float(float2q(B[i], DECIMALS), DECIMALS));
    }

    waveGen(1000, 48000);
    //writeWave(WAVE_SIZE, WAVE_FILE);

    printf("Filtered Data\n");

    int p;
    FILE *fp = fopen("vectors.txt", "w"); 
    //FILE *filter = fopen("filter.txt", "w");
    for (unsigned int i = 0; i < WAVE_SIZE; i++) {
        p = processSampleTranspose2(buffer[i]);
        fprintf(fp, "%d %d\n", buffer[i], p); 
        //fprintf(filter, "%d\n", p); 
        printf("%d\n", p);
    }
    fclose(fp); 
    //fclose(filter);
    return 0;
}
