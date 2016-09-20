f = sprintf("%.2f", 12.45834585).to_f
puts f
puts f.class
puts f + 3


def test_format(format_string, number)
	sprintf(format_string, number)
end

a = test_format("%.3f", 34.879546456).to_f
b = test_format("%.2f", 19.495000).to_f
p a
p b
p a + b
p a.class
p b.class

c = (sprintf "%.2f", 10 / 3.0).to_f
puts c
puts c.class


a = 23.869347347232
p a.round(2)
p a.round(3)
p a.class
p 19.495.round(2)
p 19.4949.round(2)
p 19.4946.round(3)


def new_format(number, format)
	number.round(format)
end

puts new_format(2.349,2)
a = new_format(19.435654675475, 3)
puts a.class
puts a