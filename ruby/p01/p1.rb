#!/usr/local/bin/ruby

numarray = Array.new
(1...1000).each do |num|
	numarray << num if (num % 3 == 0 || num % 5 ==0)
end

puts numarray.inject { |sum, n| sum + n }
