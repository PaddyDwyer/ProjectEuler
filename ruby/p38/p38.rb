#!/usr/bin/env ruby -wKU

def getPandigital(number)
	pandigitalString = ""
	i = 1
	while pandigitalString.length < 9
		pandigitalString << (number * i).to_s
		i += 1
	end
	pandigitalString
end

p getPandigital(192)
p getPandigital(1)
