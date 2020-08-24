.global _Z12eratosthenesjPj
_Z12eratosthenesjPj:
 1:
  mov   r12, #31
  add   r10, r12, r0		@input+31
  lsr   r10, #5			@(input+31)/32
  mov   r9, r1
  ldr   r8, =0xFFFFFFFF
 2:
  str   r8, [r1], #4		@set all 1s
  subs  r10, #1
  bne   2b
 3:
  lsr   r9, r10, #5
  lsl   r9, #2
  mov   r12, #31
  and   r11, r9, r12
  lsr   r3, r2, r11
  ldr   r4, [r1, r9]
  orr   r4, r3
  str   r4, [r1, r9]
 4:
  add   r10, #2
  cmp   r10, r0
  blt   3b
