array = [1.34, 2.23, 3.56, 4.98, 5.23, 6.43, 7.89, 8.88, 9.12, 10.18]
p array
p array.class
#p array.methods
p array.find_index(5.23)
p array[4]
p array.length


string = "Test word. I love ruby on rails!!!"
a = string.split
p a
p a.length

b = string.chars
b.delete(" ")
p b
p b.length


index = 0

while index < array.length
	puts array[index]
	index += 1
end

p [1,2,3,4,5].find_all { |n| n.even? }
p [1,2,3,4,5].find_all { |n| n.odd? }


public
	def new_find_all
		matching_items = []
		self.each do |item|
			if yield(item)
				matching_items << item
			end
		end
		matching_items
	end

	def new_reject
		matching_items = []
		self.each do |item|
			unless yield(item)
				matching_items << item
			end
		end
		matching_items
	end

p [1,2,3,4,5].new_find_all { |n| n.even? }
p [1,2,3,4,5].new_find_all { |n| n.odd? }

p [1,2,3,4,5].new_reject { |n| n.even? }
p [1,2,3,4,5].new_reject { |n| n.odd? }



numbers = [2,3,4]
squ = []

numbers.each do |n|
	squ << n ** 2
end
p squ



phone_numbers = ["1-800-555-0199", "1-402-555-0123"] 
area_codes = [] 

phone_numbers.each do |phone_number|   
	area_codes << phone_number.split("-")[1] 
end 
p area_codes 


numbers = [2,3,4].map { |number| number ** 2 } 
phone_numbers = ["1-800-555-0199", "1-402-555-0123"].map do |phone|   
	phone.split("-")[1]
end


public
	def new_map   
		results = []   
		self.each do |item|     
			results << yield(item)   
		end   
		results 
	end 

arr = [1,23,324,234,12,35]
arr.new_map { |i| p i * 2 }