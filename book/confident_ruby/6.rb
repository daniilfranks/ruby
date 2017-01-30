class User
	attr_accessor :name, :age

	def initialize(name, age)
		@name = name
		@age  = age
	end

	def method_missing(m, *args, &block)
		p "Undefined method: #{m}"
	end

	private

	def the_secret
		"The #{@name}"
	end
end

p user = User.new('Danila', 25)
user.no_method

p user.instance_eval { @name }
p user.instance_eval { the_secret }
p user.instance_exec(' Bob') { |i| @name + i }
