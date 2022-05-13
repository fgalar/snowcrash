#!/usr/bin/env ruby

def rot13(str)
	return str.tr("A-Za-z", "L-ZA-Kl-za-k")
end

puts rot13(ARGV[0])
