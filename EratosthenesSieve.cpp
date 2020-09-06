#include <memory.h>
#include <cstdint>
#include <iostream>
#include <cstdint>
#include <chrono>

using namespace std;
using namespace std::chrono;

uint32_t eratosthenes(uint32_t maxint, uint32_t* isNotPrime);

int main() {
  cout << "What would you like to use as the upper bound to Eratosthenes "
          "Sieve? : ";
  uint32_t input;
  cin >> input;
  cout << endl;
  uint32_t* isNotPrime = new uint32_t[input];
  auto start = high_resolution_clock::now();
  cout << "Primes less than " << input << ": "
       << eratosthenes(input - 1, isNotPrime) << endl;
  auto stop = high_resolution_clock::now();
  auto duration = duration_cast<microseconds>(stop - start);
  cout << "Time: " << duration.count() << " microseconds" << endl;
  delete[] isNotPrime;
  return 0;
}
