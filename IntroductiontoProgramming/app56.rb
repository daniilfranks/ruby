r = File.open("dohod.txt",'r')

total = 0
while (line= r.gets)
	arr = line.split ","
	value = arr[1].to_i
	total += value
end

puts "Total: #{total}"
r.close