3.times do |i|
#	puts i
end

#3.times { |i| puts i+1 }

array = []
10.times { |i| array << i if i.odd? }
#p array

#array.size.times { |i| puts array[i] }

def complex_formula(a = 10, b = 0, *array)
	sum = a + b + array.size
end

#p complex_formula(1, 2, 1,2,3,1)

argv = ARGV[0].to_i

result = case argv
	when 1..10   then 'Status 1'
	when 11..20  then 'Status 2'
	when 21..30  then 'Status 3'
	when 31..100 then 'Status 4'
	else 'No status'
end
puts result


def status(param = 0)
	raise "Param: #{param} > 10" if param > 10
	i = 0
	while i < param
		i += 1
		puts i
	end
end

#status(argv)

for i in 0..3
	#puts i
end

class User
	#attr_reader   :name
	#attr_writer   :name
	#attr_accessor :name

	def name
		@name
	end

	def name=(name)
		@name = name
	end
end

class People
	attr_accessor :first_name, :last_name
end

#p den = People.new
#p den.first_name = 'Danila'
#p den.last_name  = 'Babanov'
#p den
#p den.class


class Mathematician
	@type = 'Admin'

	def self.type
		@type
	end

	def type=(type)
		@type = type
	end
end

#p admin = Mathematician.new
#p Mathematician.type
#p admin.type = 'Moderator'
#p Mathematician.type

class A
	@param = 'Param A'

	def self.param
		@param
	end

	def self.class_method
		"Class method #{singleton_class}"
	end
end

class B  < A
	@param = 'Param B'
end

p A.param
p B.param

p A.class_method
p B.class_method
