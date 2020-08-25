.global _Z12eratosthenesjPj
_Z12eratosthenesjPj:
 set:
  lsr   r2, r0, #5
  mov   r3, #0
  str   r3, [r1, #4]
  subs  r2, #1
  bne   set
  mov   r3, #1
  mov   r5, r3
  mov   r4, #32
  lsr   r6, #5
  ldr   r8, =0x80000000
  mov   r12, #3
  mov   r7, r8
  mov   r10, #1
  mov   r9, #0
 1:
  ands  r10, r8
  bne   3f
  add   r5, #1
  ldr   r10, [r1, r9]
 2:
  mov   r7, r8
  orr   r10, r8
  ror   r7, r12
  lsrs  r10, r12
  bne   2b
  add   r6, r12, r12
  cmp   r6, r0
  bge   5f
  sub   r11, r4, r3
 3:
  cmp   r12, r11
  bgt   6f
  ldr   r10, [r1, r9]
  orr   r7, r10
  str   r7, [r1, r9]
 4:
  add   r3, #1
  add   r12, #2
  lsrs  r8, #1
  bne   1b
  add   r9, #4
  add   r4, #32
  ldr   r10, =0x800000000
  mov   r8, r10
  bl    1b
 5:
  ldr   r10, [r1, r9]
  lsrs  r8, #1
  add   r5, #1
  ands  r10, r8
  bne   5b
  mov   r0, r5
  bx    lr
 6:
  add   r9, #4
  add   r11, #32
  bl    3b
