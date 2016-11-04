obj = ""
case obj
when /\A\d+\z/
	puts "Numeric string"
when 0..10
	puts "Positive integer under 10"
when Numeric
	puts "Number"
end

even = ->(x){ (x % 2) == 0 }
even.call(2)
even.call(3)

p even === 2
p even === 3

num = 50
case num 
when even then puts "Even"
else puts "Odd"
end

require 'net/http'
SUCCESS = ->(response){ (200..299) === response.code.to_i }
CLIENT_ERROR = ->(response){ (400..499) === response.code.ro_i}

response = Net::HTTP.get_response(URI.parse("https://www.google.ru"))
case response
when SUCCESS then puts "Success!"
when CLIENT_ERROR then puts "Client error."
else puts "Other"
end