#!/usr/bin/env ruby

primes = [2]
potentialPrime = 3
while primes.length < 10001
	isnotprime = false
	for prime in primes
		if potentialPrime % prime == 0
			isnotprime = true
			break
		end
	end
	primes << potentialPrime unless isnotprime
	potentialPrime += 1
end
puts "10001st prime is #{primes[primes.length - 1]}"
