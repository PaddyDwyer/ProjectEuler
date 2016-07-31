#!/usr/bin/env ruby -wU

require "../lib/util.rb"

primes = generatePrimes(10000)
#primes = generatePrimes(1000)

puts "Done generating primes"

def concat_prime(a, b)
  (a.to_s + b.to_s).to_i
end

def is_concat_prime?(a, b)
  isPrime?(concat_prime(a, b)) && isPrime?(concat_prime(b, a))
end

allconcatprimes = primes.map do |prime|
  primes.find_all { |test_prime| is_concat_prime?(prime, test_prime) }.map { |concat_prime| [prime, concat_prime] }
end.flatten(1)

puts "found concat list"

for i in 0..2
  allconcatprimes = allconcatprimes.map do |set|
    primes.find_all { |test_prime| set.all? { |set_prime| is_concat_prime?(set_prime, test_prime) } }.map {|prime| Array.new(set) << prime }.map { |new_set| new_set.sort }
  end.flatten(1).reject { |set| set.size < 3 + i }.uniq
  puts "finished with a search loop"
  p allconcatprimes
end


# if i have a set of primes that all concat with a main prime i need to find the subset of primes that all concat with each other

