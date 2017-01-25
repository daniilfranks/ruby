def new_hash(options = {})
	options.each do |k, v|
		p "Key: #{k}"
		p "Value: #{v}"
	end
end

hash = { 1 => { name: 'Den', age: 25 }, 2 => { name: 'Leo', age: 31 } }

new_hash(hash)



class Foo
	def bar
		baz
	end

	private

	def baz
		'Hey ho'
	end
end

p Foo.new.bar


calc_1 = lambda { |a, b, c| a + b + c }
p calc_1.call(1, 2, 3)

calc_2 = ->(a, b, c) { a + b + c }
p calc_2.(1, 2, 3)

p [1,2,3].map { |i| i * 10 }.select { |i| i > 10 }


module MyHelper
	def save
		puts 'before'
		super
		puts 'after'
	end
end

class MyClass
	prepend MyHelper

	def save
		puts 'class code'
	end
end

MyClass.new.save

p __dir__
p __FILE__

#require File.expand_path(File.join(File.dirname(__FILE__), '..', 'cookbook', 'lib', 'user'))
#require File.expand_path(File.join(__dir__, '..', 'cookbook', 'lib', 'user'))
require_relative File.join('..', 'cookbook', 'lib', 'user')

p User.new('Den', 25)
