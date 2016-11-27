require 'open-uri'
require 'json'
require 'ostruct'

begin
  p parse_time = File.ctime("parseuser.json")
  p time = Time.new
  unless 50 >= (time - parse_time).to_i
    uri = open('https://api.github.com/users/danilababanov')
    user = JSON.parse(uri.read)
  end
rescue StandardError => e
  puts e
end

File.open('parseuser.json', 'w') do |w|
  w << user
end