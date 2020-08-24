.global _Z12eratosthenesjPj
_Z12eratosthenesjPj:
  lsr  r0, #5		@number of elements
  mov  r2, #1
  mov  r3, r2
  lsl  r2, #31		@0x800000000
  mov  r4, #3
  add  r5, r0, #1
 1:
  ror  r3, r4
  lsrs r2, r4
  str  r2, [r1], #4
  subs r5, #1
  bne  1b
  
 2:
  ldr  r6, [r1], #4
  lsr  r2, r4
