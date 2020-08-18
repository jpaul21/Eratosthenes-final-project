# Eratosthenes Sieve

## Procedure

1. Included for your review is an implementation of Eratosthenes in C++. Please review and ask any questions you have about this program.
2. Remove the eratosthenes implementation (everything in brackets `{}`) and add a semicolon to create a forward declaration.
3. Write Eratosthenes in ARM Assembly, making the following improvements:
   1. Booleans in C++ are stored in entire bytes. Replace the isNotPrime boolean array with a bitvector (still a large chunk of memory, but internally, you will use only 1 bit to represent each bool/number being prime). To do so, make `isNotPrime` a `uint32_t*` instead of a `bool*`. Adjust the size of isNotPrime to be correct.
   2. Since 2 is the only even number, it is pointless to process even numbers (just creating a special case for 2).
   3. It is also pointless to store even numbers; removing their storage will reduce the required storage by a factor of 2. eg. if you are given an input of `10`, only store and process `3, 5, 7, 9`.
4. Do not move any functionality in or out of the main or eratosthenes methods. The entirity of eratosthenes must be written in Assembly.
5. Your program must be capable of running on a Raspberry Pi and be able to consistently process an input of 1 billion (1000000000) in under 5 minutes.
