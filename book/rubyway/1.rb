class User
	attr_accessor :login, :eamil, :first_name, :last_name, :age, :city, :salary
	attr_reader :gender

	def initialize(&block)
		instance_eval &block
	end

	def to_s
		"#{@login}, #{@eamil}, #{@first_name}, #{@last_name}, #{@age}, #{@city}, #{@salary}, #{@gender}"
	end

	protected

	attr_writer :gender
end

den = User.new do
	self.login      = 'boban'
	self.eamil      = 'danila_babanov@yahoo.com'
	self.first_name = 'Danila'
	self.last_name  = 'Babanov'
	self.age        = 25
	self.city       = 'Kazan'
	self.salary     = 7000
	self.gender     = 'M'
end	

p den
p den.to_s
p den.login
p den.gender

p den.salary = 9000
#p den.gender = 'S'
p den.class
p den.city.class
p den.salary.class
p den.city.instance_of?(String)
p den.salary.instance_of?(Integer)
p den.city.is_a?(String)
p den.salary.is_a?(Integer)
p den.respond_to?(:to_s)
p den.respond_to?(:hello)
p den.respond_to?(:age)
