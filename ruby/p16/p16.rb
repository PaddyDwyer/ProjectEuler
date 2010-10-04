#!/usr/bin/env ruby

puts (2 ** 1000).to_s.chars.inject(0) { |sum, n| sum += n.to_i }
