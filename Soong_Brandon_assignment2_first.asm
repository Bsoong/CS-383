;
; AssemblerApplication10.asm
;
; Created: 11/5/2018 5:49:37 PM
; Author : brand
;


; Replace with your application code
;
; AssemblerApplication9.asm
;
; Created: 11/5/2018 5:26:18 PM
; Author : brand
;

; I pledge my honor that I have abided by the Stevens Honor System -- Bsoong
; Replace with your application code

.include "m328pdef.inc"

start:
    ldi r16, 0
	ldi r18, 1
	ldi r17, low (RAMEND)
	out spl, r17
	ldi r17, high (RAMEND)
	out sph, r17
	ldi zl, 0x00
	ldi zh, 0x01
loop: 
	cpi r16, 100
	breq init
	push r18
	inc r18 
	inc r16
	rjmp loop
init:
	ldi r16, 0

loop_pop:
	cpi r16, 100
	breq end
	pop r19 
	st z+, r19
	inc r16
	rjmp loop_pop

end:
	ret


