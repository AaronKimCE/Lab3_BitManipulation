/*	Author: akim106
 *  Partner(s) Name: 
 *	Lab Section:
 *	Assignment: Lab 3  Exercise 1
 *	Exercise Description: [optional - include for your own benefit]
 *
 *	I acknowledge all content contained herein, excluding template or example
 *	code, is my own original work.
 */
#include <avr/io.h>
#ifdef _SIMULATE_
#include "simAVRHeader.h"
#endif

int main(void) {
    DDRA = 0x00; PORTA = 0x00; //PORT A = inputs
    DDRB = 0x00; PORTB = 0x00; //PORT B = inputs
    DDRC = 0xFF; PORTC = 0x00; //PORT C = outputs
    unsigned char tmpIN1 = 0x00; //Temp chars to hold input and analyze
    unsigned char tmpOUT = 0x00;    
    unsigned char tmpIN2 = 0x00;

    while (1) {
      tmpIN1 = PINA; //Assigning temp values and resetting count
      tmpIN2 = PINB;
      tmpOUT = 0x00;

      for (unsigned char count1 = 0; count1 < 8; ++count1) { //Check all 8 bits
        if ((tmpIN1 & 0x01) == 0x01) { //Checking rightmost bit of PINA
          ++tmpOUT;
        }
        tmpIN1 = tmpIN1 >> 1; //Shifting to check next bit
      }
     
      for (unsigned char count2 = 0; count2 < 8; ++count2) { //Same for PINB
        if ((tmpIN2 & 0x01) == 0x01) {
          ++tmpOUT;
        }
        tmpIN2 = tmpIN2 >> 1;
      }  

    PORTC = tmpOUT; //Outputting # of 1's in binary
    }
    return 1;
}
