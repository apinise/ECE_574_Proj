#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#include "fdacoefs.h"

#define FILE_NAME "coeff.txt"
#define DECIMALS 11
#define PI 3.141592653589793
#define WAVE_SIZE 2048
#define WAVE_FILE "wave.txt"

int float2q(float x, int f);
float q2float(int x, int f);
void q2bin(int binary);
void decCoeff(void);
void writeCoeff(int size, char *File_Name);
void writeWave(int size, char *File_Name);
void waveGen(int freq, int samp);
int processSampleDirect(int sample);
int processSampleTranspose(int sample);
int processSampleTranspose2(int sample);