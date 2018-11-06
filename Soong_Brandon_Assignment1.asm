;
; AssemblerApplication6.asm
;
; Created: 10/26/2018 4:10:49 PM
; Author : Brandon Soong
;


; I pledge my honor that I have abided by the Stevens Honor System- Bssong
.include "m328pdef.inc"

start:
.def i = r17
.def maxNum = r18
.def firstE = r19
.def Sum = r20
.def avg = r21
.def bitshift = r23
   
init:
	ldi r16, 10
	sts 0x0100, r16
	ldi r16, 13
	sts 0x0101, r16
	ldi r16, 23
	sts 0x0102, r16
	ldi r16, 26
	sts 0x0103, r16
main_max:
	ldi zh, 0x01
	ldi zl, 0x00
	ldi i, 0
	ld maxNum, z+
	inc i
loop_maxNum:
	cpi i, 4
	brge main_E
	inc i
	clr r24
	ld r24, z+
	cp r24, maxNum
	brge r24_greater
	rjmp loop_maxNum
r24_greater:
	mov maxNum, r24
	rjmp loop_maxNum

main_E:
	ldi zh, 0x01
	ldi zl, 0x00
	clr i
	ldi i, 1
	ldi firstE,  0
	clr r16 
	ld r16, z+
	rjmp loop_E

loop_E:
	cpi i, 4 
	breq main_sum
	inc i
	ldi bitshift, 1
	and bitshift, r16
	cpi bitshift, 0
	breq firstEven
	ld r16, z+
	rjmp loop_E

firstEven:
	mov firstE, r16

main_sum:
	clr i 
	clr r16
	ldi zh, 0x01
	ldi zl, 0x00
	ldi i, 1
	ld Sum, z+
	ld r16, z+
	rjmp loop_sum

loop_sum:
	cpi i,4
	breq reverse
	inc i
	add Sum, r16
	ld r16, z+
	rjmp loop_sum

reverse:
	ldi r24, low(RAMEND)
	out spl, r25
	ldi r24, high(RAMEND)
	out sph, r25
	ldi zh, 0x01
	ldi zl, 0x00
	clr i
	ldi i, 1
	clr r16
	ld r16, z
	push r16
	rjmp loop_reverse

loop_reverse:
	clr r16
	cpi i,5
	brge end
	inc i
	ld r16, z+
	push r16
	rjmp loop_reverse

	

end:
	sts 0x0105, maxNum
	sts 0x0106, firstE
	sts 0x0107, Sum
	mov avg, Sum
	asr avg
	asr avg
	sts 0x0108, avg
	pop r25
	sts 0x0110, r25
	pop r25
	sts 0x0111, r25
	pop r25
	sts 0x0112, r25
	pop r25
	sts 0x0113, r25
	ret



	

