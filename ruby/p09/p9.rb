#!/usr/bin/env ruby

triplets = Array.new
max = 1000
a_array = (1..max).to_a
sqrshash = Hash.new
(1..max).to_a.map { |i| sqrshash[i * i] = i }

for a in a_array
	bstart = a+1
	b_array = (bstart..max).to_a
	for b in b_array
		csqd = (a ** 2) + (b ** 2)
		if sqrshash.has_key? csqd
			triplets << [a, b, sqrshash[csqd]]
		end
	end
end

triplets.map { |t| puts t.inject { |prod, n| prod * n } if t.inject { |sum, n| sum + n } == 1000}
