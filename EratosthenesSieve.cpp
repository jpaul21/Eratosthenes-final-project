#include <memory.h>

#include <cstdint>
#include <iostream>

using namespace std;

uint32_t eratosthenes(uint32_t maxint, bool* isNotPrime) {
  memset(isNotPrime, 0, maxint + 1);  // set the entire array to 0s
  // 0 = prime, 1 = not prime
  uint32_t numPrimes = 1;  // special case of 2 is prime
  for (uint32_t i = 3; i < maxint;
       i += 2) {  // no need to handle even numbers, so do every other number
    if (!isNotPrime[i]) {  // if the number is prime, cancel out its multiples
      for (uint32_t j = i * i; j < maxint; j += i * 2)
        isNotPrime[j] = true;  // start at i*i because that should be the
                               // smallest multiple we haven't handled
      numPrimes++;  // if when we get to a number, it is not marked, it is
                    // prime.
    }
  }
  return numPrimes;
}

int main() {
  cout << "What would you like to use as the upper bound to Eratosthenes "
          "Sieve? : ";
  uint32_t input;
  cin >> input;
  cout << endl;
  bool* isNotPrime = new bool[input];
  cout << "Primes less than " << input << ": "
       << eratosthenes(input - 1, isNotPrime) << endl;
  delete[] isNotPrime;
}