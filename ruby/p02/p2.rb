#!/usr/local/bin/ruby

start1 = 1, start2 = 2;

def fib(num1, num2, max)
	x = 0
	evenarray = Array.new
	evenarray << num1 if num1 % 2 == 0
	evenarray << num2 if num2 % 2 == 0
	while (x < max) do
		x = num1 + num2
		evenarray << x if x % 2 == 0
		num1 = num2
		num2 = x
	end

	return evenarray
end

puts fib(1, 2, 4000000).inject { |sum, n| sum + n }
