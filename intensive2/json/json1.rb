require 'json'
require 'net/http'
require 'pp'

url = 'http://jsonplaceholder.typicode.com/posts/1'
uri = URI(url)
response = Net::HTTP.get(uri)

standard = JSON.parse(response)
symbol   = JSON.parse(response, symbolize_names: true)
struct   = JSON.parse(response, object_class: OpenStruct)

# p symbol[:id]
# p symbol[:title]
# p symbol[:name] = 'Danila'
# p symbol

# p struct.id
# p struct.title
# p struct.name = 'Danila'
# p struct

require 'httparty'
require 'json'

url = 'http://jsonplaceholder.typicode.com/posts/1'
response = HTTParty.get(url)

standard = JSON.parse(response.to_json)
symbol   = JSON.parse(response.to_json, symbolize_names: true)
struct   = JSON.parse(response.to_json, object_class: OpenStruct)

# p standard
# p symbol
# p struct
