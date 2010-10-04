#!/usr/bin/env ruby -wKU -I ../lib
require "util.rb"

#ablist = generatePrimes(1000)
alist = (0..500).map { |n| (n * 2) + 1 }
blist = generatePrimes(1000)
$deflist = generatePrimes(1000000)

def getQuadraticLambda(a,b)
	return lambda { |n| n ** 2 + (a * n) + b }
end

def testLambda(a, b)
	quad = getQuadraticLambda(a, b)
	i = 0
	begin
		prm = quad.call(i)
		i += 1
	end until $deflist.index(prm).nil?
	#puts "testLambda(#{a}, #{b}) is #{i}"
	return i
end

m = 0
ansa = 0
ansb = 0
blist.each do |a|
	blist.select { |t| t > ansb }.each do |b|
		if (x = testLambda(a, b)) > m
			ansa = a
			ansb = b
			m = x
			puts "found #{x} with a #{ansa}, b #{ansb}"
		end
		if (x = testLambda(-a, -b)) > m
			ansa = a
			ansb = b
			m = x
			puts "found #{x} with -#{a}, -#{b}"
		end
		if (x = testLambda(a, -b)) > m
			ansa = a
			ansb = b
			m = x
			puts "found #{x} with #{a}, -#{b}"
		end
		if (x = testLambda(-a, b)) > m
			ansa = a
			ansb = b
			m = x
			puts "found #{x} with -#{a}, #{b}"
		end
	end
end

puts "result is a: #{ansa}, b: #{ansb}, prod #{ansa * ansb}"
