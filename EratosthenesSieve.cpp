#include <memory.h>

#include <cstdint>
#include <iostream>
#include <cstdint>

using namespace std;

uint32_t eratosthenes(uint32_t maxint, uint32_t* isNotPrime);
//{
  // memset(isNotPrime, 0, maxint + 1);  // set the entire array to 0s
  // 0 = prime, 1 = not prime
  // uint32_t numPrimes = 1;  // special case of 2 is prime
  // for (uint32_t i = 3; i < maxint;
  //      i += 2) {  // no need to handle even numbers, so do every other number
  //   if (!isNotPrime[i]) {  // if the number is prime, cancel out its multiples
  //     for (uint32_t j = i * i; j < maxint; j += i * 2)
  //       isNotPrime[j] = true;  // start at i*i because that should be the
  //                               smallest multiple we haven't handled
  //     numPrimes++;  // if when we get to a number, it is not marked, it is
  //                   prime.
  //   }
  // }
  // return numPrimes;
//}

// [3,5,7,9,11,13,15,17,19,21,23,25,27,29,31,33,35,37,39,41,43,45,47,49,51,53,55,57,59,61,63,65]
//  |                 | |                     |  |                    | |                     |
// [3,5,7,9,      15,            25,            35,                  49,                  63,  ]
// [0 0 0 1  0  0  1  0  0  1  0  1  1  0  0  1  1  0  1  0  0  1  0  1  1  0  1  1  0  0  1  1]
// [0 0 0 1  0  0  1  0  0  0  0  1  0  0  0  0  1  0  0  0  0  0  0  1  0  0  0  0  0  0  1  0]
// [0 0 0 0  0  0  0  0  0  1  0  0  1  0  0  1  0  0  1  0  0  1  0  0  1  0  1  1  0  0  0  1]
// [67,69,71,73,75,77,79,81,83,85,87,89,91,93,95,97,99,101,103,105,107,109,111,113,115,117,119,121,123,125,127,129]
//   0  1  0  0  1  1  0  1  0  0  1  0 1  1   1  0  1  0   0   1   0   0   1   0   1   1   1   1   1   1   0   0   
// 3 -> 3*1 lsr, 3*1 lsr(wrt 9), 3*2(wrt 3)
// 5 -> 5*2 lsr, 5*1 lsr(wrt 25), 5*3(wrt5)
// lsr >= 31 next element

int main() {
  cout << "What would you like to use as the upper bound to Eratosthenes "
          "Sieve? : ";
  uint32_t input;
  cin >> input;
  cout << endl;
  uint32_t* isNotPrime = new uint32_t[input];
  cout << "Primes less than " << input << ": "
       << eratosthenes(input - 1, isNotPrime) << endl;
  delete[] isNotPrime;
}