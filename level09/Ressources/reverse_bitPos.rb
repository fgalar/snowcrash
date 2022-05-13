#!/usr/bin/ruby

def reverse(str)
	hash = ""
	str = str.bytes
	str.each.with_index do |char, i|
		if (char - i) < 0
			next
		else
			hash << (char - i).chr 
		end
	end
	puts hash

end

File.open(ARGV[0]) do | content |

	content.each_line do | line |
		reverse(line)
	end
=begin
	pswd = ""

	content.each_line do | line |

		# remove '\n' or '\r'
		line = line.chomp

		if line.casecmp('0d') == 0	# '\r'
			next
		elsif line.casecmp('7f') == 0	# DEL
			pswd.chop!
		else
			pswd << [line].pack("H*")
		end
	end
	puts '=>' +  pswd
=end
end
