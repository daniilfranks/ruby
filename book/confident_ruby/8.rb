p Float.const_defined?(:EPSILON)

module SuperUser
	def super_user
		"Hi super user!"
	end
end

module Admin
	include SuperUser
	class User
		AGE = 25
		attr_accessor :name

		def initialize(name)
			@name = name
		end

		def hello
			"Hello #{@name}"
		end
	end
end

p Admin.const_defined?(:User)
p Admin::User.new('Den')

p Admin::User.const_get(:AGE)
p Admin::User.const_set(:CITY, 'Kazan')
p Admin::User::CITY
p Admin::User.constants.include?(:CITY)

p '*'*40

class Role
	include Admin
end

p Role.include?(Admin)
#p Role.include?(Moderator)

p SuperUser.included_modules
p Admin.included_modules

p Admin.instance_methods
#p Admin::User.instance_methods
p Admin::User.instance_methods.include?(:hello)

p Admin::User.method_defined?(:hello)

p '*'*40

module Foo
	@@number = 10

	def number
		@@number
	end

	def method1
		'method1'
	end

	def method2
		'method2'
	end

	def method3
		'method3'
	end

	private   :method1
	protected :method3
end

Foo.extend(Foo)
#p Foo.method1
p Foo.instance_methods
p Foo.private_instance_methods
p Foo.private_method_defined?('method1')
p Foo.method_defined?('method1')
p Foo.protected_method_defined?('method3')
p Foo.public_method_defined?('method2')

#p Foo.number
#p Foo.number.remove_class_variable(:@@number)
#p Foo.number

p Foo.singleton_class?

p '*'*40

class A
	def den
		'Hi den'
	end

	define_method(:asd) { 'Hi asd' }
end

class B < A
	define_method(:bob, instance_method(:den))
	define_method(:leo) { 'Hi leo' }
end

p a = B.new
p a.den
p a.bob
p a.leo
p a.asd

p '*'*40

module Pic
	def Pic.extend_object(param)
		p "Pic: #{param.class}"
	end

	def self.extended(param)
		p "#{self}, extend in #{param}"
	end

	def Pic.included(param)
		p "#{self}, included in #{param}"
	end
end

str = 'string'
p str.extend(Pic)

p '*'*40

integer = 1
p integer.extend(Pic)

p '*'*40

module FooBar
	include Pic
end

p FooBar.extend(FooBar)
