#!/usr/bin/env ruby -wKU -I ../lib
require 'util'

# use the miller rabin test to check primality
def isPrime?(n) 
	return false if n == 1
	nminus = n - 1
	s = 0
	d = nminus
	while d % 2 == 0
		d /= 2
		s += 1
	end
	#puts "s #{s} d #{d}"
	alla = []
	if n < 4
		alla = [2]
	elsif n < 1373653
		alla = [2, 3] 
	elsif n < 9080191
		alla = [31, 73]
	elsif n < 4759123141
		alla = [2, 7, 61]
	end
	alla.each do |a|
		if (a ** d) % n != 1 && (0..(s-1)).all? { |r| (a ** ((2 ** r) * d)) % n != nminus }
			return false
		end
	end
	return true
end
isPrime? 3

$endarray = ["3", "7"]
$middlearray = ["1", "3", "7", "9"]

def createNumbers(numOfDigits)
	ary = $endarray
	numOfDigits.times { |i| ary = ary.product($middlearray) }
	ary = ary.product($endarray)
	ary.map { |a| a.flatten! ;a.reduce("") { |str, s| str + s }.to_i }
end


def isTruncatable?(number)
	str = number.to_s
	istruncatable = true
	i = str.length - 1
	while i > 0
		left = str[0...(-i)].to_i
		right = str[i..-1].to_i
		#puts "left #{left} right #{right}"
		if !isPrime?(left) || !isPrime?(right)
			istruncatable = false
			break
		end
		i -= 1
	end
	istruncatable
end

i = 0
truncatable = []
while truncatable.length < 10
#while i < 1
	nums = createNumbers(i)
	#p nums
	nums.each { |n| truncatable << n if isPrime?(n) && isTruncatable?(n) }
	i += 1
end

p truncatable
