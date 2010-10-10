#!/usr/bin/env ruby -wKU -I ../lib

require 'util'

d = [1, 2, 3, 4, 5, 6, 7]

primePandigitals = d.permutation.map { |n| n.to_s.to_i }.select { |n| isPrime? n }

p primePandigitals.max

