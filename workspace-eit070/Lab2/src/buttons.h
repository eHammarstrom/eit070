/*
 * buttons.h
 *
 *  Created on: 14 feb. 2017
 *      Author: dic14gsj
 */

#ifndef SRC_BUTTONS_H_
#define SRC_BUTTONS_H_

#define BUTTONS_DATA (unsigned int *) 0x40000000
#define BUTTONS_CONTROL (unsigned int *) 0x40000004

#define UP 0b10
#define DOWN 0b10000
#define MIDDLE 0b1
#define LEFT 0b100
#define RIGHT 0b1000

#endif /* SRC_BUTTONS_H_ */
