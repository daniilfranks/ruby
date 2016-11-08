@names = %w[Den Jok Io Leo]

def names
	yield @names.shift
	yield @names.shift
	yield @names.shift
	yield @names.shift
end

names do |name|
	puts name
end

@names = %w[Den Jok Io Leo]
p enum = to_enum(:names)
p enum.next
p @names

@names = %w[Den Jok Io Leo]
p enum = to_enum(:names)
enum.with_index do |name, index|
	puts "#{index} #{name}"
end