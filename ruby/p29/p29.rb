#!/usr/bin/env ruby -wKU

input = 100
terms = Array.new
(2..input).each { |a| (2..input).each { |b| terms << (a ** b) } }
p terms.uniq.length
