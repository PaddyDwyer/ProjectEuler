#!/usr/bin/env ruby -wKU

lw = 1001
i = 1
diagonals = Array.new
diagonals << i
sum = 0
adder = 2
while adder <= (lw - 1)
	4.times { |n|
		i += adder
		diagonals << i
	}
	adder += 2
end

p diagonals.reduce(:+)
