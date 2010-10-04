#!/usr/bin/env ruby -wKU

def ispalindromic?(number)
	str = number.to_s
	numDigits = str.length
	if numDigits % 2 == 0
		leftSide = str[0...(numDigits/2)]
		rightSide = str[-(numDigits/2)..-1]
	else
		leftSide = str[0..(numDigits/2)]
		rightSide = str[-(numDigits/2 + 1)..-1]
	end
	puts "ls: #{leftSide} rs: #{rightSide}"
	puts "reverse #{rightSide.reverse}"
	puts "equals #{leftSide == rightSide.reverse}"
	leftSide == rightSide.reverse
end

ispalindromic? 11
ispalindromic? 1
ispalindromic? 5885
ispalindromic? 5785
ispalindromic? 585
ispalindromic? 584

def generatePalindrome(number)
	str = number.to_s
	even = str + str.reverse
	odd = str + str.reverse[1..-1]
	puts "odd #{odd} even #{even}"
	[odd.to_i, even.to_i]
end

generatePalindrome(1)
generatePalindrome(58)

def getBinary(number)
	str = ""
	i = 0
	while (p = 2 ** i) <= number
		if number & p == p
			str = "1" + str
		else
			str = "0" + str
		end
		i += 1
	end
	puts "base 10: #{number} base 2: #{str}"
	str
end

getBinary 585

ispalindromic? getBinary 585

# generate palindromic numbers

palindromes = []
(1..999).to_a.each { |i|
	palindromes << generatePalindrome(i)
}
palindromes.flatten!.sort!

p palindromes

both = []
palindromes.each { |p|
	b = getBinary p
	both << p if ispalindromic? b
}

p both

puts "Sum is #{both.reduce(:+)}"
getBinary 5
getBinary 7
getBinary 9
getBinary 8
