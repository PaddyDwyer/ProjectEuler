#!/usr/bin/env ruby

x = 0, y = 0
$gridSize = 20

def findOldNextLocation(x, y)
	sum = 0
	if x < $gridSize
		sum += findOldNextLocation(x + 1, y)
	end
	if y < $gridSize && y < x
		sum += findOldNextLocation(x, y + 1)
	end
	if x == $gridSize && y == $gridSize
		#puts "found route"
		sum = 1
	end
	return sum
end

def findNextLocation()
	rows = Array.new
	rows[0] = Array.new($gridSize - 1, 1)

	while rows.length < $gridSize - 1
		newRow = Array.new
		i = 0
		while i < rows[-1].length - 1
			newRow << rows[-1][i..-1].reduce(:+)
			i += 1
		end
		rows << newRow
	end
	total = rows.inject(0) { |topsum, a| topsum += a.reduce(:+) }
	return total + 1
end

puts "no. of routes based on grid of size #{$gridSize}: #{($gridSize + 1) * findNextLocation()}"
#puts "no. of routes based on grid of size #{$gridSize}: #{($gridSize + 1) * findOldNextLocation(0, 0)}"


#10 184756
# 
