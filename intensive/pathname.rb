require 'pathname'

pn = Pathname.new('pathname/text.txt')
p pn.size
p pn.directory?
p pn.dirname
p pn.basename
p pn.read
p pn.split