.global _Z12eratosthenesjPj	@r3=bit#; r4=32*xbits; r5=# of primes; r6=
_Z12eratosthenesjPj:		@r7=overflow bit; r8=next odd#; r9=element to load/store
  push  {r4-r12}		@r10=normal op; r11=remaining shifts in element; r12=shifts needed
  lsr   r2, r0, #5
  add   r2, #1
  mov   r3, #0
 set:
  str   r3, [r1, #4]		@store 0s
  subs  r2, #1
  bne   set
  mov   r3, #1
  mov   r5, #0
  mov   r4, #32
  ldr   r8, =0x80000000
  mov   r2, r8
  mov   r12, #3
  mov   r9, #0
 1:
  add   r5, #1			@prime num +=1
  mov   r8, r2
  ldr   r10, [r1, r9]
  mov   r7, r8			@reset overflow bit
 2:
  ror   r7, r12
  lsrs  r8, r12
  orr   r10, r8
  bne   2b			@loop normal op
  str   r10, [r1, r9]
  add   r6, r3, r12		@check for last element
  cmp   r6, r0
  bge   5f			@begin final loops
  sub   r11, r4, r3
 3:				@load and store overflow
  cmp   r12, r11
  bgt   6f
  add   r9, #4
  ldr   r10, [r1, r9]
  orr   r7, r10
  str   r7, [r1, r9]
  sub   r9, #4
  ldr   r10, [r1, r9]
 4:
  cmp   r12, r0
  bge   store
  add   r3, #1			@next +1 value
  add   r12, #2			@increment +=2 (shifter)
  lsr   r2, #1
  tst   r10, r2
  bne   4b
  cmp   r2, #0
  bne   1b
  add   r4, #32
  ldr   r2, =0x800000000
  add   r9, #4
 @ lsr   r9, r4, #3
 @ sub   r9, #4
  ldr   r10, [r1, r9]
 subr:
  tst   r10, r2
  beq   1b
  ror   r2, #1
  bl    subr
 reset:
  add   r9, #4
  ldr   r2, =0x80000000
 5:				@final countdown
  str   r10, [r1, r9]
 final:
  ldr   r10, [r1, r9]
  add   r3, #1
  lsrs  r2, #1
  beq   reset
  tst   r10, r2
  bne   final
  add   r5, #1
  orr   r10, r2
  str   r10, [r1, r9]
  cmp   r3, r0
  blt   final
 store:
  mov   r0, r5
  pop   {r4-r12}
  bx    lr
 6:
  add   r9, #4
  add   r11, #32
  bl    3b
