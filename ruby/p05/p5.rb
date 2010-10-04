#!/usr/bin/env ruby
# This is basically find the the lowest common divisor
factors = [5, 7, 9, 11, 13, 16, 17, 19]
#factors = [5, 7, 8, 9]

num = 0

found = false

until found
	num += 19
	puts "checking #{num}"
	found = factors.map { |factor| num % factor == 0 }.inject { |value, bool| value && bool }
end

puts "number: #{num}"
