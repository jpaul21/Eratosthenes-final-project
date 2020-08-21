.global _Z12eratosthenesjPj
_Z12eratosthenesjPj:
  push  {r1, r2}
 1:
  mov   r2, #0
  str   r2, [r1], #4		@[0,0,0..0] all prime
  subs  r0, #1
  bne   b1			@end loop
  pop   {r1, r2}		@go back to a[0]
  push  {r4, r5, r6, r7, r8, r9}
  ldr   r2, #0x80000000		@odd prime# start(#3)
 2:
  mov   r3, r2			@r3=spot holder for next element
  mov   r4, r2			@next prime#
  mov   r5, #3			@odd# +=2 Incrementor
  mov   r6, #32
  mov   r7, #0
  mov   r8, #1
@ lsr   r7, r0, #5		@r7=#elements
 3:
  mov   r2, r4
 4:
  lsrs  r2, r5
  movlt r8, r2, #8
  beq   5f
  orr   r7, r2
  add   r8, #1
  bl    4b
 5:
 @ ror   r10, #1
 @ lsrs  r9, #1
 @ beq   6f
  lsrs  r4, #1			@next odd prime(#5)
  beq   6f
  add   r5, #2
  tst   r7, r4
  beq   5b
  bl    3b
 6:
  str  r7, [r0], #4
  mov  r2, r8
  subs r0, #1
  bne  2b
  ldr  r2, [r1], #4
  mov  r3, #0x800000000
 7:
  ands r2, r3
  bne  7b
  mov  r0, r8
  pop  {r4, r5, r6, r7, r8, r9}
  bx   lr
