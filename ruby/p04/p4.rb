#!/usr/bin/env ruby

leftSide = 999

found = false

until found
	palindrome = "#{leftSide}#{leftSide.to_s.reverse}".to_i
	puts "palindrome #{palindrome}"
	factor = 999
	while factor > 500
		if palindrome % factor == 0
			puts "factor #{factor}"
			otherFactor = palindrome / factor
			puts "otherFactor #{otherFactor}"
			if otherFactor < 1000 && otherFactor > 99
				found = true
				break;
			end
		end
		factor -= 1
	end
	leftSide -= 1
end
