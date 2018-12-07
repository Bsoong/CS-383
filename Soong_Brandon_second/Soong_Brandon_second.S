//I pledge my Honor that I have abided by the Stevens Honor System -- Bsoong
#include "avr/io.h"
.text
.global setup
.global loop
.global timer

setup:
  ldi r16, 0b00110000
  sts DDRB, r16

loop:
  ldi r17, 0b00100000
  sts PORTB, r17
  call timer
  ldi r17, 0b00010000
  sts PORTB, r17
  call timer
  jmp loop

timer:
    ldi  r18, 5
    ldi  r19, 194
    ldi  r20, 134
    ldi  r21, 33
L1: dec  r21
    brne L1
    dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
ret