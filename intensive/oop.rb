class CoffeMachine
	def make_coffee
    get_start
    get_water(200)
    get_beans(50)
		coffe_ready
	end

  def get_start
    puts "Start"
  end

  def coffe_ready
    puts "Coffee ready!"
  end

  def get_water(mls)
    puts "Water #{mls}mls."
  end

  def get_beans(grams)
    puts "Beans #{grams}grams."
  end
end

one = CoffeMachine.new
one.make_coffee

p "Line".center(50, "=")

two = CoffeMachine.new
two.make_coffee


class Father
	def check_self(object)
		object == self
	end
end

son = Father.new
p son
p son.check_self(son)

p son.check_self(Father)


class People
	puts "Class self: #{self}"

	def print_self
		puts "Method self: #{self}"
	end
end

p "Line".center(50, "=")
people = People.new
p people
p people.print_self

p people.methods
#p "Line".center(50, "=")
#p People.instance_methods