require 'net/http'
require 'uri'

uri = 'https://github.com/'
uri = URI.parse(uri)

response = Net::HTTP.get_response(uri)
p response
p response.code
#p response.body

uri  = URI('https://www.google.ru/')
http = Net::HTTP.get(uri)
#p http

uri = URI('https://www.google.ru/#newwindow=1&q=car')
http = Net::HTTP.get(uri)
puts http