#!/usr/bin/env ruby

i = 1
found = false
sum = 0
begin
	sum += i
	puts "sum #{sum}, formula #{(i * (i + 1)) / 2}"
	#fac = 1
	#count = 2
	#puts "checking #{sum}"
	#while fac < (sum / 2).ceil
		#if sum % fac == 0
			#puts "\tfound fac #{fac}"
			#count += 1
		#end
		#fac += 1
	#end
	#puts "count #{count}"
	#if (count) >= 99
		#found = true
	#end
i += 1
end until i > 10

puts "first num is #{sum}"
