#!/usr/bin/env ruby -wKU -I ../lib

require 'monkey/integer'

def generateTriple(m, n)
	return [(m ** 2 - n ** 2), (2 * m * n), (m ** 2 + n ** 2)]
end

def generateTriplePP(m)
	return [m, (m ** 2 - 1) / 2, (m ** 2 + 1) / 2] if m % 2 != 0
	return [m, (m / 2) ** 2 - 1, (m / 2) ** 2 + 1]
end

m = 2
last = [0, 0, 0]
triples = {}
while last.reduce(:+) < 1600
#while last[-1] < 100
	if m % 2 == 0
		n = 1
	else
		n = 2
	end
	while n < m
		if m.gcd(n) == 1
			last = generateTriple(m, n)
			triples[last.reduce(:+)] = last.sort
		end
		n += 2
	end
	m += 1
end

primitives = triples.sort.select { |a| a[0] < 1000}
p primitives
p primitives.count

pvalues = Hash.new { |hash, key| hash[key] = [] }

primitives.each do |a|
	pvalues[a[0]] << a[1]
	k = 2
	while k * a[0] < 1000
		pvalues[k * a[0]] << a[1].map { |n| n * k }
		k += 1
	end
end

pvalues.each_key { |key| pvalues[key].uniq! }
sizes = pvalues.map { |key, value| [key, value.length] }

p sizes.max {|a, b| a[1] <=> b[1]}

#p pvalues

# a = 2mn
# b = m^2 - n^2
# c = m^2 + n^2
# p = a + b + c
# p = 2mn + (m^2 - n^2) + (m^2 + n^2)
# p = 2mn + m^2 - n^2 + m^2 + n^2
# p = 2mn + m^2 + m^2
# p = 2mn + 2m^2
