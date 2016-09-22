class Counter
	def initialize
		@count = 0
	end

	def increment
		@count += 1
	end
end

a = Counter.new
p a.increment
p a.increment
p a.increment


class CelestialBody   
	attr_accessor :type, :name 
end 

bodies = Hash.new do |hash, key|   
	body = CelestialBody.new   
	body.type = "planet"   
	hash[key] = body 
end 

bodies['Mars'].name = 'Mars' 
bodies['Europa'].name = 'Europa' 
bodies['Europa'].type = 'moon' 
bodies['Venus'].name = 'Venus' 

p bodies



letters = ['a', 'c', 'a', 'b', 'c', 'a'] 
counts = Hash.new(0) 

letters.each do |letter|   
	counts[letter] += 1 
end 

p counts