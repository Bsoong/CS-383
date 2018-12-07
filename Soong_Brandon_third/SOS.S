#include "avr/io.h"
.text
.global setup
.global loop
.global timer
.global again

setup:
ldi r16, 0b00100000
sts DDRB, r16
loop:
  call bloop
  call bloop
  call bloop
  call timer_300
  call blip
  call blip
  call blip
  call timer_300
  jmp loop
blip:
  ldi r17, 0b00100000
  sts PORTB, r17
  call timer_150
  ldi r17, 0b00000000
  sts PORTB, r17
bloop:
  ldi r17, 0b00100000
  sts PORTB, r17
  call timer_400
  ldi r17, 0b00000000
  sts PORTB, r17
timer_300:
  ldi r18, 13
  ldi r19, 45
  ldi r20, 216
L1: dec r20
  brne L1
  dec r19
  brne L1
  dec r18
  brne L1
timer_400:
  ldi r18, 17
  ldi r19, 60
  ldi r20, 204
  L3: dec r20
  brne L3
  dec r19
  brne L3
  dec r18
  brne L3
timer_150:
  ldi r18, 7
  ldi r19, 23
  ldi r20, 107
  L2: dec r20
  brne L2
  dec r19
  brne L2
  dec r18
  brne L2
  nop
