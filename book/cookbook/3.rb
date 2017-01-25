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
