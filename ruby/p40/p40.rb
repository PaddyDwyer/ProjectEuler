#!/usr/bin/env ruby -wKU

str = ""
i = 1
while str.length < 1000000
	str << i.to_s
	i += 1
end

p str
