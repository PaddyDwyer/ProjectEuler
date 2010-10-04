#!/usr/bin/env ruby -wKU

x = (100..1000000).to_a.select { |n| (n.to_s.chars.reduce(0) { |sum, c| sum + (c.to_i ** 5) }) == n }
p x
p x.reduce(:+)
