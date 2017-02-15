class SuperGeneratorFile
	attr_reader :user, :city, :age

	def initialize(user = 'default', city = 'default', age = 0)
		@user = user
		@city = city
		@age  = age
	end

	def show_generator
		content
	end

	private

	def head
		"***** Head file *****"
	end

	def body
		raise 'Body is empty!!!!'
	end

	def footer
		"*" * 40
	end

	def content
		#[head, body, footer].each { |f| puts "#{f}\n" }
		puts [head, body, footer].join("\n")
	end
end

class A < SuperGeneratorFile
	private

	def body
		"#{user}, #{city}, #{age}"
	end
end

class B < SuperGeneratorFile
	private

	def body
		"This is class #{self.class.name}"
	end
end

class C
	attr_reader :sgf 

	def initialize(sgf)
		@sgf = sgf
	end

	def show_generator
		content
	end

	private

	def head
		"***** Head file *****"
	end

	def body
		"#{@sgf.user}, #{@sgf.city}, #{@sgf.age}"
	end

	def footer
		"+" * 40
	end

	def content
		puts [head, body, footer].join("\n")
	end
end

class D < SuperGeneratorFile
	attr_reader :sgf

	def initialize(sgf)
		@sgf = sgf
	end

	private

	def body
		"#{@sgf.user}, #{@sgf.city}, #{@sgf.age}, class: #{self.class.name}"
	end

	def footer
		"===== #{Time.new} ====="
	end
end

sgf = SuperGeneratorFile.new('Den', 'Kazan', 25)
p sgf
#p sgf.show_generator

a = A.new('Den', 'Kazan', 25)
p a
a.show_generator

puts

b = B.new
p b
b.show_generator

puts

c = C.new(sgf)
p c
c.show_generator

puts 

d = D.new(sgf)
p d
d.show_generator
