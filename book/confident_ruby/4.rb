User = Struct.new(:name, :age)
p den = User.new('Den', 25)

den.define_singleton_method(:hello_class) do 
	"Hi #{name}, #{age}, #{ self.instance_variable_defined?(:@city) ? @city : 'Default' }"
end

p den.hello_class
p den.instance_variable_defined?(:@name)
p den.instance_variable_set(:@city, 'Tatarstan')

p den.hello_class
p den.instance_variable_get(:@city)

p den.to_s
p den.instance_variables

leo = den.clone
p leo

p leo.name = 'Leo'
p leo.age = 31
p leo
