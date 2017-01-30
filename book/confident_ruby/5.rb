p Array(1..5)
p Float(1)
p Hash(key: 'value')
p Integer(10.10)
p String(10)

p '*'*40

p __dir__
p __FILE__

# block_given?
def hi_world
	yield if block_given?
end

p hi_world { 'hello' }

def my_name(param)
	"Hi #{param}"
end

#p exec("echo *")

#i = 0
#loop do
	#puts 'Hi ruby!'
	#i += 1
	#exit if i >= 3
	#break if i >= 3
#end

p sprintf("%.1f", 10.888888)
p sprintf("%.2f", 10.888888)

p '*'*40

open('name.txt') { |f| puts f.gets }

print 'Ruby'
puts

#raise ArgumentError, 'O_o Error!!!'
p rand(100)
p rand(10..20)

open('name.txt') { |f| puts f.readline }
open('name.txt') { |f| puts f.readlines }

p '*'*40

#require 'file.rb'
#require_relative 'file.rb'
