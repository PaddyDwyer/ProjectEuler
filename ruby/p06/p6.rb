#!/usr/bin/env ruby

sum_of_squares = (1..100).inject { |sum, n| sum + (n ** 2) }
square_of_sum = (1..100).inject { |sum, n| sum + n } ** 2

diff = square_of_sum - sum_of_squares

puts "difference #{diff}"
