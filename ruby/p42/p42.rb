#!/usr/bin/env ruby -wKU

wordstxt = File.new("words.txt")

line = wordstxt.readline

line.gsub!(/"/, "")
words = line.split(",")

def getValue(word)
	word.bytes.reduce(0) { |sum, c| sum + c.to_i - 64 }
end

values = words.map { |w| getValue w }

triangles = [1]
n = 2
while triangles[-1] < values.max
	triangles << (n * (n + 1)) / 2
	n += 1
end

p values.select { |v| triangles.include? v }.size
