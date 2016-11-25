require 'digest'

password = 'x7Q8(1k$4Z0j52C'
password << 'secret'
p Digest::SHA256.digest password
p Digest::SHA256.hexdigest password
p Digest::SHA256.base64digest password

p '='*30

p Digest::SHA384.digest password
p Digest::SHA384.hexdigest password
p Digest::SHA384.base64digest password

p '='*30

p Digest::SHA512.digest password
p Digest::SHA512.hexdigest password
p Digest::SHA512.base64digest password

p '='*30

p Digest::MD5.hexdigest password

require 'csv'

CSV.open('secret.csv', 'w') do |write|
  write << ['Secret', 'name', 'password']
end

p Digest::SHA512.file('secret.csv').hexdigest


puts 'Login form'
print "Enter you login: \n"
login = gets.strip

print "Enter you password: \n"
password = gets.strip
password = Digest::SHA512.base64digest password

loop do
  puts "Are you registered!"
  puts "Enter your username and password to access!"

  print "Enter you login: \n"
  login2 = gets.strip
  break if login2 == ""

  print "Enter you password: \n"
  password2 = gets.strip
  password2 = Digest::SHA512.base64digest password2

  break puts "Hi #{login2}, you are access!" if password == password2
end