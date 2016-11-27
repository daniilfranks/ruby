require 'open-uri'
require 'json'
require 'ostruct'

begin
  parse_time = File.ctime("parseuser.json")
  time = Time.new
  unless 500 > (time - parse_time).to_i
    uri = open('https://api.github.com/users/danilababanov')
    user = JSON.parse(uri.read)
    File.open('parseuser.json', 'w') do |w|
      w << user
    end
  end
rescue StandardError => e
  puts e
end