#!/usr/bin/env ruby
# using a sieve here was probably pointless

class MaxDivisor
	def initialize( bignum )
		@bignum = bignum
		@primeArray = Array.new
		@lastDivisor = 0
		findInitialPrimes()
	end

	def findInitialPrimes()
		ints = (2..10000).to_a
		prime = ints.shift
		while (prime < 10)
			@primeArray << prime
			ints.delete_if { |x| x % prime == 0 }
			prime = ints.shift
		end
		@primeArray.concat( ints )
		puts @primeArray.join(", ")
	end

	def findDivisor()
		@primeArray.each do |prime|
			if (@bignum % prime == 0)
				@lastDivisor = prime
				@bignum = @bignum.div(prime)
				puts "bignum #{@bignum} divided by #{prime}"
				return findDivisor
			end
		end
	end

	def lastDivisor
		@lastDivisor
	end
end

md = MaxDivisor.new(600851475143)
md.findDivisor()
puts md.lastDivisor
