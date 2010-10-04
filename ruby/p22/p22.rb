#!/usr/bin/env ruby

file = File.new("names.txt", "r")

names = file.gets.scan(/\w+/).sort

p "A".bytes.map {|c| c - 64 }
p names[937].bytes.map { |c| c - 64 }.reduce(:+)

total = 0
0.upto(names.length - 1) do |i|
	nameval = names[i].bytes.map { |c| c - 64 }.reduce(:+)
	total += nameval * (i + 1)
end

puts "total #{total}"
