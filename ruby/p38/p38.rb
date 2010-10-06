#!/usr/bin/env ruby -wKU -I ../lib

require 'util'

def getPandigital(number)
	pandigitalString = ""
	i = 1
	while pandigitalString.length < 9
		pandigitalString << (number * i).to_s
		i += 1
	end
	pandigitalString
end

puts "testing #{v = getPandigital(192)}: #{isPandigital? v}"
puts "testing #{v = getPandigital(1)}: #{isPandigital? v}"
puts "testing #{v = getPandigital(2)}: #{isPandigital? v}"
puts "testing #{v = getPandigital(3)}: #{isPandigital? v}"

max = 0
(1..49999).each do |i|
	no = getPandigital(i)
	if isPandigital? no
		max = [max, no.to_i].max
	end
end

p max
