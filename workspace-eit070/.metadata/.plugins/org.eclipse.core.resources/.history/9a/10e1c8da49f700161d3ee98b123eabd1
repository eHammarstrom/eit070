/*#include "address_mapping.h"

void readSwitches_writeLed();

int main() {
	*SWITCHES_CONTROL = 0xFFFF;
	*LED_CONTROL = 0;
	while (1 == 1)
		readSwitches_writeLed();
}

void readSwitches_writeLed() {
	unsigned int temp;
	temp = *SWITCHES_DATA;
	*LED_DATA = temp;
}*/

#include "address_mapping.h"

void readSwitches_writeLed();
unsigned int readSwitches();
void writeLed(unsigned int value, unsigned int v1, unsigned int v2, unsigned int v3, unsigned int v4, unsigned int v5, unsigned int v6, unsigned int v7);

int main() {
	*SWITCHES_CONTROL = 0xFFFF;
	*LED_CONTROL = 0;
	while (1 == 1)
		readSwitches_writeLed();
}

void readSwitches_writeLed() {
	unsigned int temp;
	temp = readSwitches();
	writeLed(temp, temp + 1, temp + 2, temp + 3, temp + 4, temp + 5, temp + 6, temp + 7); //the i-th argument is temp+i
}

unsigned int readSwitches() {
	unsigned int temp;
	temp = *SWITCHES_DATA;
	return temp;
}

void writeLed(unsigned int value, unsigned int v1, unsigned int v2, unsigned int v3, unsigned int v4, unsigned int v5, unsigned int v6, unsigned int v7) {
	*LED_DATA = value;
}
