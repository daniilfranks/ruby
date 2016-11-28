require 'rest-client'
#https://github.com/rest-client/rest-client

response = RestClient.get 'https://www.google.ru'

p response.code
p response.cookies
p response.headers
#p response.body