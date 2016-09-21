def my_method(&my_block)
	puts "We're in tht method"
	my_block.call
	puts "We're back in the method"
	my_block.call
end

my_method do
	puts "We're in the block"
end


def give(&my_block)
	yield("Hi param1","Hi param2")
end

give do |param1, param2| 
	puts param1
	puts param2
end


def take_this
	yield "present"
	yield "ho ho ho"
end

take_this { |t| puts "Braces block got #{t}"}



def param_block
	yield 9,3
end

param_block { |param1, param2| puts param1 / param2}
param_block { |param1, param2| puts param1 * param2}
param_block { |param1, param2| puts param1 + param2}
param_block { |param1, param2| puts param1 - param2}


public
	def neweach
		index = 0
		while index < self.length
			yield self[index]
			index += 1
		end
	end

array = ["Ruby", "Php", "C+", "Js"]
array.neweach {|param| puts param}



def total(prices)   
	amount = 0   
	prices.each do |price|     
		amount += price   
	end   
	amount 
end 

def refund(prices)  
	amount = 0   
	prices.each do |price|    
  amount -= price  
 end
  amount 
end 
 
def show_discounts(prices)   
	prices.each do |price|     
		amount_off = price / 3.0     
		puts format("Your discount: $%.2f", amount_off)   
	end 
end 

prices = [3.99, 25.00, 8.99]

puts format("%.2f", total(prices)) 
puts format("%.2f", refund(prices))
show_discounts(prices)


def print_block
	block_result = yield
	puts block_result
end

print_block { 1+1 }
print_block do 
	"Not return"
	"Result!"
end
print_block { "I hated Truncated".include?("Truncated")}


def hi
	puts "Hi #{yield}"
end

hi { "Den" }


def triple_block
	puts 3 * yield
end

triple_block { 3 }


def alert_if_true
	if yield
		puts "true"
	else
		puts "false"
	end
end

alert_if_true { 2 + 2 == 5}

name = ""
alert_if_true { name != ""}

alert_if_true { 2 > 1 }


def calc
	result = yield(1, 1)
	puts result
end

calc do |param1, param2|
	param1 + param2
end