module Mod
	NUMBER_MOD = 1

	def mod_method
		'Mod method'
	end

	def my_name(name)
		"Hi my name #{name}"
	end
end

p Mod.class
p Mod.constants
p Mod.instance_methods

p Mod.extend(Mod)
p Mod.mod_method
p Mod.my_name('Den')
p Mod::NUMBER_MOD

p '*'*40
#p Module.constants
p Mod.constants.include?(:NUMBER_MOD)
p Module.constants.include?(:NUMBER_MOD)

den = Module.new do
	def method1
		'Hi bro'
	end

	def method2(name)
		"My name #{name}"
	end
end

a = ''
a.extend(den)
p a.method1
p a.method2('Den')

module A
	refine Object do
	end

	def method1
		'Hi bro'
	end
end

module B
	refine Object do
	end
end

using A
using B

p Module.used_modules
p Module.ancestors

p '*'*40

class Thing
	@@foo = 100

	def foo
		@@foo
	end
end

# module_eval
a = %q{ def hi(name) "Hi #{name}" end} 
Thing.module_eval(a)
p Thing.new.hi('Den')
p Thing.new.hi('Leo')

# class_exec

Thing.class_exec{
	def you_age(age)
		"You age #{age}"
	end
}
puts Thing.new.you_age(25)
puts Thing.new.you_age(31)

# class_variable_defined?
puts Thing.class_variable_defined?(:@@foo)
puts Thing.class_variable_defined?(:@@bar)

# class_variable_get
puts Thing.class_variable_get(:@@foo)

# class_variable_set
puts Thing.class_variable_set(:@@foo, 200)
puts Thing.new.foo

puts Thing.class_variable_set(:@@bar, 800)

# class_variables
puts Thing.class_variables
