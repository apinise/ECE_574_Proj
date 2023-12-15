/*
 * Packet.h
 *
 *  Created on: Nov 30, 2023
 *      Author: kosti
 */

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <math.h>

#ifndef PACKET_H_
#define PACKET_H_

#define Write_Preamble    0xFB   //// packet write
#define Read_Preamble     0xFC   //// packet read
#define NUM_PACKETS 32


void intToBinaryString(int num, char* binaryString);
int packet();



#endif /* PACKET_H_ */
