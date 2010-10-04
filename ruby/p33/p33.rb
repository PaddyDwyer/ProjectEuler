#!/usr/bin/env ruby -wKU

class Integer
	def gcd(other)
		min = self.abs
		max = other.abs
		while min > 0
			tmp = min
			min = max % min
			max = tmp
		end
		max
	end
end

$digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

nums = Array.new

$digits.each { |ad| $digits.each { |bd| nums << (ad + bd) } }

fractions = Array.new

"1".upto("9") { |i|
	r1 = Regexp.new("[^#{i}]")
	cand = nums.select { |n| n.include? i }
	cand.each { |numerator|
		cand.each { |denominator|
			if numerator < denominator
				orign = numerator.to_i
				origd = denominator.to_i
				simn = numerator[r1].to_i
				simn = i.to_i if simn.nil?
				simd = denominator[r1].to_i
				simd = i.to_i if simd.nil?
				p [orign, origd, simn, simd]
				origgcd = orign.gcd origd
				p origgcd
				simgcd = simn.gcd simd
				if (orign / origgcd) == (simn / simgcd) && (origd / origgcd) == (simd / simgcd)
					fractions << [orign, origd]
				end
				#checkstuff
			end
		}
	}
}

ans = fractions.reduce([1,1]) { |prod, a| [prod[0] * a[0], prod[1] * a[1]] }
ansgcd = ans[0].gcd ans[1]
p ansgcd

p [ans[0] / ansgcd, ans[1] / ansgcd]
