#!/usr/bin/env ruby -wKU -I ../lib

def getPeriod(number)
	while number % 2 == 0
		number /= 2
	end
	while number % 5 == 0
		number /= 5
	end
	i = 1
	begin
		puts "it's now 10 ** #{i}"
		m = (10 ** i) % number
		puts "evals as #{m}"
		i += 1
	end until m == 0 || m == 1
	if m == 0
		return 0
	elsif m == 1
		return i
	end
end

m = 0
d = 0
(2..1000).each { |i|
	puts "testing #{i}"
	if (x = getPeriod(i)) > m
		m = x
		d = i
	end
}

puts "divisor with longest period is #{d}"
