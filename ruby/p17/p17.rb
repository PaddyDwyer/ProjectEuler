#!/usr/bin/env ruby

$numberNamesHash = { 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven", 8 => "eigth",
	9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 14 => "fourteen", 15 => "fifteen", 16 => "sixteen",
	17 => "seventeen", 18 => "eighteen", 19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty",
	60 => "sixty", 70 => "seventy", 80 => "eighty", 90 => "ninety"}

def numberToName(num) 
	if $numberNamesHash.key? num
		return $numberNamesHash[num]
	elsif num < 100
		res = num.divmod(10)
		return $numberNamesHash[res[0] * 10] + numberToName(res[1])
	elsif num < 1000
		res = num.divmod(100)
		name = $numberNamesHash[res[0]] + "hundred"
		if res[1] > 0
			name += "and" + numberToName(res[1])
		end
		return name
	else
		return "onethousand"
	end
end

puts (1..1000).to_a.map { |i| numberToName(i) }.reduce(0) { |sum, s| sum += s.length }
