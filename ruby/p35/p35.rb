#!/usr/bin/env ruby -wKU -I ../lib

require 'util.rb'
puts "generating primes"
primes = generatePrimes(1000000)

def generateCircle(n)
	chars = n.chars.to_a
	circ = Array.new
	n.length.times { circ << (chars << chars.shift).to_s.to_i }
	circ
end

puts "selecting primes"
primes = primes.select { |p| p.to_s.index(/[246805]/).nil? }

puts "search primes"
allcircular = [2, 5]
primes.each { |p|
	unless allcircular.include? p
		circle = generateCircle(p.to_s)
		isCircular = circle.all? { |c| primes.include? c }
		if isCircular
			allcircular << circle
		end
	end
}

allcircular.flatten!.uniq!.sort!

puts "count of allcircular is #{allcircular.length}"
