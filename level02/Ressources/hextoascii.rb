#!/usr/bin/ruby

File.open(ARGV[0]) do | content |

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
	puts pswd
end
