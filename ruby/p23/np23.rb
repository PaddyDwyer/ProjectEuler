#!/usr/bin/env ruby

input = 28123
#input = 5000

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
			primeFactors[num] += 1 unless $primes.index(num).nil? || num == 2
		elsif
			i += 1
		end
	end
	sumofdivisors = primeFactors.map { |p, m| (p ** (m + 1) - 1)/(p - 1) }.reduce(:*)
	sumofdivisors = 0 if sumofdivisors.nil?
	#puts "sumofdivisors #{sumofdivisors}" if number == 4096
	return sumofdivisors - number
end

puts "d(2) #{d(2)}"
puts "d(4) #{d(4)}"
puts "d(4096} #{d(4096)}"
puts "d(28) #{d(28)}"
puts "d(12) #{d(12)}"
puts "d(9) #{d(9)}"
puts "d(27) #{d(27)}"

nums = (0..input).to_a
abundant = Array.new # base abundant, doesn't include multiples
puts "finding abundant"

12.upto(input) do |i|
	if d(i) > i
		abundant << i
		combos = abundant.map { |x| x + i } 
		#puts "abundant noo is #{i}"
		#p combos
		combos.each do |c|
		#puts "\t doing #{c}, nums[c] = #{nums[c]}" if c == 80
			if nums[c] != 0
				dels = Array.new( 2 * (input/c).ceil ) { |x| x * c }
				#p dels if c == 80
				dels.each { |x| nums[x] = 0 if x <= input }
				#p nums if c == 80
			end
		end
	end
end
#p abundant
puts "nums"

nums = nums.select { |n| n != 0 }
#p nums
puts nums.reduce(:+)
