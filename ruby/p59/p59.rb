#!/usr/bin/env ruby -wU

require 'open-uri'

def xor(key, text)
  keylength = key.length
  text.each_with_index.map { |x, i| x ^ key[i % keylength] }
end

# download the cipher file if it doesn't exist
unless File.exist?('cipher.txt')
  open('cipher.txt', 'wb') do |file|
    file << open('https://projecteuler.net/project/resources/p059_cipher.txt').read
  end
end

# parse cipher file into an array
f = File.new('cipher.txt')
cipher_chars = f.read().split(",").map { |s| s.to_i }

# generate keys
# keys are 3 lowercase chars long
(97..122).each do |i|
  (97..122).each do |j|
    (97..122).each do |k|
      key = [i, j, k]
      test_chars = xor(key, cipher_chars)

      ctrl_chars = test_chars.select { |c| c < 32 || c > 126 }

      if (ctrl_chars.empty?)
        keytext= key * ','
        cipher_text = test_chars.map { |c| c.chr }.join
        sum = test_chars.reduce(:+)
        print keytext, ": ", sum, ", ", cipher_text, "\n"
      end
    end
  end
end

