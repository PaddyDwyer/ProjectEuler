def generatePrimes(input)
	nums = (2..input).to_a

	i = 0
	while i < Math.sqrt(input).ceil
		lasti = i
		dels = Array.new( (input/nums[i]).ceil ) { |x| x * nums[i] + lasti }
		dels.shift
		dels.each { |x| nums[x] = 0 }

		begin 
			i += 1
		end while nums[i] == 0
	end

	nums.select { |n| n != 0 }
end


def isPandigital?(number)
	return false if number =~ /0/ || number.length != 9
	chars = number.chars
	(1..9).all? { |no| chars.count(no.to_s) == 1 }
end

def modpow(base, exponent, modulus)
	result = 1
	while exponent > 0
		if (exponent & 1) == 1
			result = (result * base) % modulus
		end
		exponent = exponent >> 1
		base = (base * base) % modulus
	end
	return result
end

# use the miller rabin test to check primality
def isPrime?(n) 
	return false if n == 1
	return true if n == 2
	return false if n % 2 == 0
	nminus = n - 1
	s = 0
	d = nminus
	while d % 2 == 0
		d /= 2
		s += 1
	end
	#puts "s #{s} d #{d}"
	alla = []
	if n < 4
		alla = [2]
	elsif n < 1373653
		alla = [2, 3] 
	elsif n < 9080191
		alla = [31, 73]
	elsif n < 4759123141
		alla = [2, 7, 61]
	end
	alla.each do |a|
		if modpow(a, d,  n) != 1 && (0..(s-1)).all? { |r| modpow(a ,(2 ** r) * d, n) != nminus }
			return false
		end
	end
	return true
end
