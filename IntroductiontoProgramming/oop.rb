class User
	#attr_reader :name, :age
	#attr_writer :name, :age

	def initialize(options={})
		@name = options[:name]
		@age = options[:age]
	end

	def name
		@name
	end

	def age
		@age
	end

	def name=(name)
		@name = name
	end

	def age=(age)
		@age = age
	end

end

den = User.new({age: 25, name: "Den"})
puts den.name
puts den.age
den.name = "No name"
puts den.name
puts den.age = 26


class Role < User
	def initialize(options)
		@role = options[:role]
		super
	end

	attr_accessor :role
end

jok = Role.new({name: "Jok", age: 31, role: 1 })
puts jok.name
puts jok.age
puts jok.role