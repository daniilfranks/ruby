book = open('../book')
lines = 0
while(chunk = book.read(1024))
	lines += chunk.count("\n")
end

puts lines