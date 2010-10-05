#!/usr/bin/env ruby -wKU -I ../lib
require	'util'

$primes = generatePrimes 8000000
#$primes = generatePrimes 1000

puts "primes generated"

def truncatable?(number)
	str = number.to_s
	istruncatable = true
	i = str.length - 1
	while i > 0
		left = str[0...(-i)].to_i
		right = str[i..-1].to_i
		#puts "left #{left} right #{right}"
		if !$primes.include?(left) || !$primes.include?(right)
			istruncatable = false
			break
		end
		i -= 1
	end
	istruncatable
end

selected = $primes.select { |p| p.to_s =~ /^[37][1379]*[37]$/ }
p selected
puts selected.size


truncatable = selected.select { |p| truncatable? p }

#$primes.each { |p|
	#str = p.to_s
	#if str.match(/^[37][1379]*[37]$/)
		#truncatable << p #if truncatable? p
	#end
#}

p truncatable

puts "size #{truncatable.length}"
