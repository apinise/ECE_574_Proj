/*
 * Packet.c
 *
 *  Created on: Nov 30, 2023
 *      Author: Kosti
 */



#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>

#include "Packet.h"
#include "main.h"
#include <stdio.h>
#include <stdint.h>


int Packet[NUM_PACKETS];
char PacketBinary[32][33];
uint32_t Packet_read[NUM_PACKETS];
char PacketBinary_read[32][33];


int packet() {
    uint16_t kleo;
    
    
    for (uint8_t i = 0; i < NUM_PACKETS; ++i) {
        kleo = decTapCoeff[i];
        Packet[i] = (Write_Preamble << 24) | (i << 16) | kleo;
        Packet_read[i] = (Read_Preamble << 24) | (i << 16) | 0;
    }

    for (int i = 0; i < NUM_PACKETS; ++i) {
        intToBinaryString(Packet[i], PacketBinary[i]);
        intToBinaryString(Packet_read[i], PacketBinary_read[i]);
    }

    FILE *filePointer;

    // Open a file in write mode
    filePointer = fopen("packets.txt", "w");

    // Check if the file opened successfully
    if (filePointer == NULL) {
        printf("Error opening the file.\n");
        return -1;
    } else {
    	printf("Write opened successfully. \n");
    }

    // Write values and binary representations to the file using fprintf
    for (int i = 0; i < NUM_PACKETS; ++i) {
        fprintf(filePointer, "%s\n", PacketBinary[i]);
    }

    // Close the file
    fclose(filePointer);
    
    filePointer = fopen("packets_read.txt", "w");

    // Check if the file opened successfully
    if (filePointer == NULL) {
        printf("Error opening the file.\n");
        return -1;
    } else {
    	printf("Read opened successfully. \n");
    }

    // Write values and binary representations to the file using fprintf
    for (int i = 0; i < NUM_PACKETS; ++i) {
        fprintf(filePointer, "%s\n", PacketBinary_read[i]);
    }

    // Close the file
    fclose(filePointer);

    printf("Values written to file successfully.\n");

    return 0;
}

// Function definition to convert an integer to a binary string
void intToBinaryString(int num, char* binaryString) {
    int i;
    for (i = 31; i >= 0; --i) {
        binaryString[i] = (num & 1) ? '1' : '0';
        num >>= 1;
    }
    binaryString[32] = '\0'; // Null-terminate the string
}

