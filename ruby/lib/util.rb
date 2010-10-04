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
