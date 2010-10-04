#!/usr/bin/env ruby

puts (1..100).to_a.reduce(:*).to_s.chars.reduce(0) { |sum, c| sum += c.to_i }
