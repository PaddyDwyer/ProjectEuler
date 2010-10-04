#!/usr/bin/env ruby

bigl = 0
start = 0
1000000.downto(1) do |i|
	hotpo = Array.new
	hotpo << i
	while hotpo[-1] != 1
		n = 0
		if hotpo[-1] % 2 == 0
			n = hotpo[-1] / 2
		elsif
			n = 3 * hotpo[-1] + 1
		end
		hotpo << n
	end
	if bigl < hotpo.length
		bigl = hotpo.length
		start = i
		puts "new bigL #{bigl}, started with #{start}"
	end
end


