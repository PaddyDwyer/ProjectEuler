#!/usr/bin/env ruby

count = 0
(1901..2000).each do |y|
	(1..12).each { |m| count += 1 if Time.utc(y, m, 1).wday == 0 }
end

puts "count #{count}"
