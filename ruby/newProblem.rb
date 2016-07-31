#!/usr/bin/env ruby -wU

name = ARGV[0]
Dir.mkdir(name)
nf = File.new("#{name}/#{name}.rb", "w", 0755)
nf.puts("#!/usr/bin/env ruby -wKU")
