#sudo apt-get install tree
#tree

require 'pathname'
p = Pathname.new("usr/local/bin")
p.ascend do |path|
	puts path
end