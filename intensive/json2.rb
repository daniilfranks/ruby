require 'open-uri'
require 'json'
require 'ostruct'

uri = open('https://api.github.com/users/danilababanov')
user = JSON.parse(uri.read)
File.open('parseuser.json', 'w') do |w|
  w << user
end
