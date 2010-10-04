#!/usr/bin/env ruby

input = 28123

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
puts "found primes"

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

abundant = Array.new
oddabundant = Array.new
12.upto(input) do |i|
	if d(i) > i
		abundant<< i
		oddabundant << i if i % 2 != 0
	end
end

nosum = Array.new
1.upto(input) do |i|
	j = 0
	addit = true
	if i % 2 == 0
		if i < 48
			while abundant[j] < i 
				subend = i - abundant[j]
				unless abundant.index(subend).nil?
					addit = false
					break
				end
				j += 1
			end
		else
			addit = false
		end
	else
		while oddabundant[j] < i
			subend = i - oddabundant[j]
			unless abundant.index(subend).nil?
				addit = false
				break
			end
			j += 1
		end
	end
	nosum << i if addit
end

p nosum
puts nosum.length

puts nosum.reduce(:+)
