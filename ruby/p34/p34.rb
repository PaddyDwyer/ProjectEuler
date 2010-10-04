#!/usr/bin/env ruby -wKU

def fac(n)
	if n == 1
		return n
	else
		return n * fac(n - 1)
	end
end

$digits = {"0" => 1, "1" => fac(1), "2" => fac(2), "3" => fac(3), "4" => fac(4), "5" => fac(5), "6" => fac(6), "7" => fac(7), "8" => fac(8), "9" => fac(9)}
p $digits

# How do i know i'm done
# the more digits in a number, the less chance it will be curious

def isvalid(n)
	cars = n.chars.reduce(0) { |sum, c| sum + $digits[c] }
	#puts "n #{n} cars #{cars}"
	return n.to_i == cars
end

curious = Array.new
3.upto(2000000) do |i|
	curious << i if isvalid i.to_s
end

p curious.reduce(:+)
