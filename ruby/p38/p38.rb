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
