@r0 = num limit;   r1 =  array pointer;   r3 = rotating placeholder for next element;   r4 = next start point
@r5 = incrementor(+=2) and odd num;   r6= 32bit to store;   r7 = num Primes;   r8 = (num limit)/32
@r9 = a[i+1] bits;   r10 = (odd num)/32   r11 = current element; 1st element = a[1], not a[0]
@r12 = scratch register or = r10 - r11 (buffer);

.global _Z12eratosthenesjPj
_Z12eratosthenesjPj:
  push  {lr}			@pushed lr; bx lr wouldn't exit the function
  ldr   r2, =0x80000000
  lsr   r8, r0, #5		@r8=counter for exiting
 1:
  mov   r3, r2			@r3=value set in a[i+x]
  mov   r4, r2			@next prime#
  mov   r5, #3			@odd# +=2 Incrementor
  mov   r6, #0			@r6=32 bit to store
  mov   r7, #1			@r7=count of prime
  mov   r10, #0
  mov   r11, #0
  mov   r12, #0			@r12=r9,r12 swap a[i+2]
  mov   r10, #3
 2:
  mov   r9, #0			@r9=spot holder for a[i+x]
 3:
  ror   r3, r5			@loop until overflow
  lsrs  r2, r5
  beq   11f			@go to overflow buffer
  orr   r6, r2
  bl    3b
 4:
  add   r7, #1			@num Primes
  lsrs  r4, #1			@next odd prime(#5) in a[i]
  beq   6f
 5:
  add   r5, #2			@increment +=2
  cmp   r5, r0			@quick check ex: input = 5(r0) = (3+=2) -> store
  bge   6f			@store 32 bit if limit# reached
  mov   r2, r4
  mov   r3, r4			@restart count at next odd num ex: 10000 -> 01000
  ands  r12, r6, r4		@test for unset bit
  beq   3b
  bne   4b
 6:
  str   r6, [r1], #4
 7:
  add   r11, #1
  ldr   r4, =0x80000000
  cmp   r10, #0
  beq   finish
 rotate:
  ror   r4, #1			@restarts odd num counter after storing
  ands  r4, r12
  beq   rotate
  mov   r5, #3
  cmp   r11, r8
  blt   3b			@go back to normal operation
 finish:
  mov   r0, r7
  pop   {r9, pc}
 8:
  orr   r9, r3			@r9; next element bits
  bl    4b
 9:
  push  {r9}			@a[i+1] pushed to stack
  add   r11, #1
  mov   r9, r3
  bl    4b
 10:
  mov   r12, r9
  orr   r12, r3
  pop   {r9}
  eor   r12, r9, r12
  eor   r9, r9, r12
  eor   r12, r9, r12		@swap r9, r12
  add   r11, #2
  bl    4b
 11:				@buffer/check
  cmp   r5, r0
  bge   6b			@store if reached limit
  lsr   r10, r5, #5
  sub   r10, r11		@go to orr, push, or pop
  cmp   r10, #0
  beq   8b
  cmp   r10, #1
  beq   9b
  bgt   10b
