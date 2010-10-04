#!/usr/bin/env ruby

input = 10000

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

$primes = nums.select { |n| n != 0 }
p $primes

def d(number)
	num = number
	primeFactors = Hash.new(0)
	i = 0
	while $primes[i] <= Math.sqrt(num).ceil
		if num % $primes[i] == 0
			primeFactors[$primes[i]] += 1
			num /= $primes[i]
			primeFactors[num] += 1 unless $primes.index(num).nil?
		elsif
			i += 1
		end
	end
	sumofdivisors = primeFactors.map { |p, m| (p ** (m + 1) - 1)/(p - 1) }.reduce(:*)
	sumofdivisors = 0 if sumofdivisors.nil?
	return sumofdivisors - number
end



amicable = Array.new
10000.downto(1) do |i|
	res = d(i)
	if res > 0 && d(res) == i && res != i
		amicable << i
		amicable << res
	end
end

p amicable.uniq!

p amicable.reduce(:+)
