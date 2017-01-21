class User
	attr_accessor :name, :age, :city, :file

	def initialize(name, age, city, file)
		@name = name
		@age  = age
		@city = city
		@file = file
	end

	def user
		"#{@name} #{@age} #{@city} \n"
	end

	def read_file
		file = param_file('r')
		file.each { |f| p f.strip }
		file.close
	end

	def write_file
		file = param_file('a')
		file.write(user)
		file.close
	end

	private

	def param_file(param)
		file = File.open(@file, param)
	end
end 

=begin

attr-reader :conect

def initialize(flle)
	if File.exist?(file)
		@conect = File.new(file, 'r')
	else
		false
	end
end

=end