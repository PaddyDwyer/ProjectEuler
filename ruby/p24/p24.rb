#!/usr/bin/env ruby -wKU

a = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
#a = ["0", "1", "2", "3", "4"]

perms = Array.new

i = 0
while perms.length < 1000000
	ary = a.select { |e| e.to_i != i }
	p ary
	perms += ary.permutation.to_a.map do |e|
		e.unshift("#{i}");
		e.join("").to_i
	end
	p perms.length
	i += 1
end

perms.sort!

puts perms[999999]
puts perms[1000000]
