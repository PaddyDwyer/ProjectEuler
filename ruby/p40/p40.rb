#!/usr/bin/env ruby -wKU

str = ""
i = 1
while str.length < 1000000
	str << i.to_s
	i += 1
end

d = []
digits = str.chars.to_a
7.times { |i| d << digits[(10 ** i) - 1] }

p d.reduce(1) { |prod, c| prod * c.to_i }
