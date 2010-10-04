#!/usr/bin/env ruby -wKU

$digits = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

def getNumber(noofdigits)
	$digits.permutation(noofdigits).map { |a| a.to_s }
end

def isPandigital(number)
	return false if number.length != 9
	chars = number.chars
	$digits.all? { |no| chars.count(no) == 1 }
end

multiples = getNumber(1) + getNumber(2) + getNumber(3) + getNumber(4) + getNumber(5) + getNumber(6) #+ getNumber(7)

$products = Array.new
multiples.each { |two|
	multiples.each { |three|
		product = two.to_i * three.to_i
		str = [product, two, three].to_s
		break if str.length > 9
		$products << product if isPandigital(str)
	}
}

p $products.uniq
p $products.uniq.reduce(:+)
