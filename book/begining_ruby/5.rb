p Dir.exist?('user') ? 'Directorie exist' : Dir.mkdir('user')
#Dir.chdir('user')
p Dir.pwd

p Dir.entries("user")
#Dir.foreach("user") {|x| p x }

require 'fileutils'
require 'tmpdir'
filename = File.join(Dir.tmpdir, 'newfile.txt')
file = File.new(filename, 'w')
file.puts 'First string'
file.close
File.delete(filename)
