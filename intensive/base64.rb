# Модуль Base64 предусматривает кодирование

require 'base64'

name = 'Danila'

enc = Base64.encode64(name)
puts enc

plain = Base64.decode64(enc)
puts plain


hash = {}

print "Enter you name: \n"
names = Base64.encode64(gets.strip)

print "Enter you password: \n"
password = Base64.encode64(gets.strip)

hash[:name]     = names
hash[:password] = password

puts hash

puts hash[:password]
puts Base64.decode64(hash[:password])