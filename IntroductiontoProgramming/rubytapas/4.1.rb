def progname; "Dis-organizer"; end

module DisOrganizer
	def version; "Mark 7"; end
end

class CoffeeEnabled
	def service_inquiry 
		"order you a coffe" 
	end
end

class ObsequiousImp
	include DisOrganizer

	attr_reader :designation
	attr_accessor :special_feature

	def initialize(designation)
		@designation = designation
	end

	def salutation; "Most agreeable to see you"; end

	def service_inquiry
		special_feature.service_inquiry
	end

	def greet(title, first_name, last_name)
		full_name = "#{first_name} #{last_name}"

		puts "#{salutation}, #{title}, #{full_name}. ",
			"Welcome to #{progname} version #{version}. ",
			"My name is #{designation}. ",
			"May I #{service_inquiry}?"
	end
end

imp = ObsequiousImp.new("Seeree")
imp.special_feature = CoffeeEnabled.new
imp.greet("Commander", "Danila", "Babanov")