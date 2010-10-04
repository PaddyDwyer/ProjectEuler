#!/usr/bin/env ruby
input = 2000000

nums = (2..input).to_a

i = 0
while i < Math.sqrt(input).ceil
	lasti = i
	dels = Array.new( (input/nums[i]).ceil ) { |x| x * nums[i] + lasti }
	dels.shift
	dels.each { |x| nums[x] = 0 }

	begin 
		i += 1
	end while nums[i] == 0
end

primes = nums.select { |n| n != 0 }

i = 1
found = false
sum = 0
begin
	sum += i
	fac = 0
	thisnum = sum
	primeFactors = Hash.new(0)
	while primes[fac] < Math.sqrt(thisnum).ceil
		if thisnum % primes[fac] == 0
			primeFactors[primes[fac]] += 1
			thisnum = thisnum / primes[fac]
			primeFactors[thisnum] += 1 unless primes.index(thisnum).nil?
		elsif
			fac += 1
		end
	end
	count = primeFactors.values.inject(1) {|prod, v| prod * (v + 1) }
	found = true if (count) >= 500
i += 1
end until found

puts "first num is #{sum}"
