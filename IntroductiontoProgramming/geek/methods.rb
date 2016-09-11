def int a, b
	return a + b
end

p int 2, 4
p int 5, 8


p 1.odd?
p 2.even?

def odd x
	x % 3 == 1
end

def even x
	x % 2 == 0
end

p odd 1
p odd 2
p even 1
p even 2