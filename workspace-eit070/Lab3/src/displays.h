/*
 * displays.h
 *
 *  Created on: 14 feb. 2017
 *      Author: dic14gsj
 */

#ifndef SRC_DISPLAYS_H_
#define SRC_DISPLAYS_H_

void displayDigitAtIndex(unsigned char index, unsigned char digit);
unsigned int numberOfDigits(unsigned int x);
void displayNumber(unsigned int x);
void resetDisplayAtIndex(unsigned char x);
void resetDisplays();
void displayNumberAtIndex(unsigned char index, unsigned int x);

#endif /* SRC_DISPLAYS_H_ */
