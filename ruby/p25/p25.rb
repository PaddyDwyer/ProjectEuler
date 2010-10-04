#!/usr/bin/env ruby -wKU

last = 0
num1 = 1
num2 = 1
str = ""
i = 2
while str.length < 1000
	i += 1
	last = num1 + num2
	str = last.to_s
	puts "fib(#{i}) = #{last}"
	num1 = num2
	num2 = last
end

puts "long num is #{i}"
