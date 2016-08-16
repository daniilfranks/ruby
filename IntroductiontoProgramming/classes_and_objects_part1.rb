class GoodDog
	attr_accessor :name, :height, :weight

	def initialize name, height, weight
		@name = name
		@height = height
		@weight = weight
	end

	def get_name
		@name
	end

	def set_name=(name)
		@name = name
	end

	def speak
		"#{@name} says arf!"
	end

	def change_info name, height, weight
		@name = name
		@height = height
		@weight = weight
	end

	def info 
		"#{name}, #{height}, #{weight}"
	end
end

sparky = GoodDog.new("Sparky", 23, 32)
p sparky.speak
p sparky.get_name
sparky.set_name = "Spartacus"
p sparky.get_name

carli = GoodDog.new("Carli", 12, 10)
p carli.info
carli.change_info("Mari", 10, 8)
p carli.info
