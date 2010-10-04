#!/usr/bin/env ruby -wKU

count = 0
a = 0
while (a * 100) <= 200
	b = 0
	while (a * 100) + (b * 50) <= 200
		c = 0
		while (a * 100) + (b * 50) + (c * 20) <= 200
			d = 0
			while (a * 100) + (b * 50) + (c * 20) + (d * 10) <= 200
				e = 0
				while (a * 100) + (b * 50) + (c * 20) + (d * 10) + (e * 5) <= 200
					f = 0
					while (a * 100) + (b * 50) + (c * 20) + (d * 10) + (e * 5) + (f * 2) <= 200
						puts "#{a}.100 + #{b}.50 + #{c}.20 + #{d}.10 + #{e}.5 + #{f}.2"
						count += 1
						f += 1
					end
					e += 1
				end
				d += 1
			end
			c += 1
		end
		b += 1
	end
	a += 1
end

puts "count #{count + 1}"

# 0
# 50
# 50, 50
# 50, 50, 50
# 50, 50, 50, 50
# 100
# 100 50
# 100 50 50
# 100 100
