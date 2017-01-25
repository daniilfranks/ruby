#p 10.class
#p 10.0.class
#p 10000000000000000000000.class

p '405'.oct
p '405'.to_i(8)
p '405'.hex
p '405'.to_i(16)
p '405'.to_i(32)

arr = [1,2,3] 
p arr[rand(arr.size)]

hash = { key1: 'val1', key2: 'val2', key3: 'val3', }
value = hash.values
p value[rand(value.size)]


def generate_password(param = 12)
	array = [((0..9).to_a)*4, ('a'..'z').to_a, ('A'..'Z').to_a].flatten
	array.sample(param).join
end

p generate_password(30)


def fibo(limit)
	seed1 = 0
	seed2 = 1

	while seed2 < limit
		p seed2
		seed1, seed2 = seed2, seed1 + seed2
	end
end

fibo(100)

p '*'*40

require 'date'

p DateTime.new(2017, 02, 28, 18, 30, 10, '+3:00')
p DateTime.new(2017, 02, 28, 18, 30, 10, '+3:00').to_s

p DateTime::now
p DateTime::now.to_s

date = DateTime.now
p date.year
p date.hour

p Date.parse('2017-01-25').to_time

p (Date.new(2017, 1, 1)..Date.new(2017, 1, 31)).each { |i| puts i }
#p (Date.new(2017, 1, 1).day..Date.new(2017, 1, 31).day).each { |i| puts i }

p Date.parse('2017-01-25').to_time

