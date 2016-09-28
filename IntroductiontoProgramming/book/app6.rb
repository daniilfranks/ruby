$globalname = "Global name"

module DisOrganizer
	VERSION = "Mark 7"
end

module NewModule
	def newmodulename; "===Module name method==="; end
end

class CoffeeEnabled
	def service_inquiry
		"order you a coffee"
	end
end

class ObsequiousImp
	include NewModule

	SALUTION = "Most agreeable to see you"

	attr_accessor :special_feature
	attr_accessor :load_coffee

	def initialize(designation, special_feature, load_coffee)
		@designation = designation
		@special_feature = special_feature
		@load_coffee = load_coffee
	end

	def service_inquiry
		load_coffee.service_inquiry
	end

	def salution; "Method salution"; end

	def greet(title, first_name, last_name)
		progname = "First prog"
		full_name = "#{first_name} #{last_name}"

		puts "#{full_name}"
		puts "#{SALUTION}"
		puts "#{title}"
		puts "#{progname} #{DisOrganizer::VERSION}"
		puts "$globalname"
		puts "#{@designation}"
		puts "#{special_feature}"
		puts "#{salution}"
		puts "#{newmodulename}"
	end	

	def to_s
		"#{@designation} #{@special_feature}"
	end
end

imp = ObsequiousImp.new("Seeree", "special_feature", "Coffe")
imp.greet("New title", "Den", "Bob")
imp.special_feature
p imp.special_feature = "New"
puts imp
imp.load_coffee = CoffeeEnabled.new