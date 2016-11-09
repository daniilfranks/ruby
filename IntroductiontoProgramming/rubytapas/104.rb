require 'date'

print_format = '%-d/%-m/%Y %-k:%M'
p Time.new(2016, 11, 9, 20, 28).strftime(print_format)

format = '%d/%m/%Y %k:%M'
p time_parts = DateTime._strptime("9/11/2016 20:28", format)

time = Time.local(
	time_parts[:year],
	time_parts[:mon],
	time_parts[:mday],
	time_parts[:hour],
	time_parts[:min])

p time

#gem install chronic
require 'chronic'

time = Chronic.parse("9/11/2016 20:39")
p time