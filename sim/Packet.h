/*
 * Packet.h
 *
 *  Created on: Nov 30, 2023
 *      Author: kosti
 */

#ifndef PACKET_H_
#define PACKET_H_

#define Write_Preamble    0xFB   //// packet write
#define Read_Preamble     0xFC   //// packet read
#define NUM_PACKETS 32


void intToBinaryString(uint32_t num, char* binaryString);


const uint16_t TAP[32] = {
    123, 456, 789, 1011, 1213, 1415, 1617, 1819, 2021, 2223,
    2425, 2627, 2829, 3031, 3233, 3435, 3637, 3839, 4041, 3243,
    445, 2647, 449, 1051, 1153, 455, 557, 859, 2061, 3263,
    465, 3667
};


#endif /* PACKET_H_ */
