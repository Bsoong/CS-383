;
; AssemblerApplication7.asm
;
; Created: 10/25/2018 4:46:57 PM
; Author : brand
;I pledge my honor that I have abided by the Stevens Honor System - Bsoong

; Replace with your application code

start:
	ldi r16, low(RAMEND)
	out spl, r16
	ldi r16, high(RAMEND)
	out sph, r16
	ldi r22, 2
	sts 0x0100, r22
	ldi r22, 34
	sts 0x0101, r22
	ldi r22, 3
	sts 0x0102, r22
	ldi r22, 12
	sts 0x0103, r22
	ldi r22, 8
	sts 0x0104, r22
	ldi r21, 0
main:
	cpi r21, 5
	breq end
	inc r21
	rjmp findMax
findMax:
	ldi r17, 1
	ldi zl, 0x00
	ldi zh, 0x01
	ld r19, z+
MaxLoop:
	cpi r17, 5
	breq MaxEnd
	inc r17
	ld r20, z+
	cp r20, r19
	brge tempval
	rjmp MaxLoop

tempval:
	mov r19, r20
	rjmp MaxLoop

MaxEnd:
	ldi r17, 0
	ldi zh, 0x01
	ldi zl, 0x00
	push r19
	rjmp Loop2

Loop2:
	cpi r17, 5
	breq main
	inc r17
	ld r20, z
	cp r20, r19
	breq setVal
	ld r29, z+
	rjmp Loop2

setVal:
	ldi r22, -1
	st z+, r22
	rjmp main

end:
	ldi zh, 0x01
	ldi zl, 0x65
	ldi r17, 1
	pop r20
	st z+, r20

loop3:
	cpi r17, 5
	breq endend
	pop r20
	st z+, r20
	inc r17
	rjmp loop3

endend:
	rjmp endend
	