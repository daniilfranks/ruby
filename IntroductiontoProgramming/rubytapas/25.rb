=begin
require 'open-uri'
require 'json'

def get_observation
	url = "http://api.wunderground.com/api/d9b50ebd4c8bde25/geolookup/conditions/forecast/q/Russia/Kazan.json"
	data = open(url).read
	JSON.parse(data)['current_observation']
end

def print_observation(observation)
	puts "Temperature: #{observation['temp_c']}C"
	pressure_trend = observation['pressure_trend'] == "-" ? "falling" : "rising"
	puts "Pressure: #{observation['pressure_mb']}mb and #{pressure_trend}"
	puts "Winds: #{observation['wind_string']}"
end

print_observation(get_observation)
=end

require 'open-uri'
require 'json'
require 'ostruct'

def get_observation
	url = "http://api.wunderground.com/api/d9b50ebd4c8bde25/geolookup/conditions/forecast/q/Russia/Kazan.json"
	data = open(url).read
	OpenStruct.new(JSON.parse(data)['current_observation'])
end

def print_observation(observation)
	puts "Temperature: #{observation.temp_c}C"
	pressure_trend = observation.pressure_trend == "-" ? "falling" : "rising"
	puts "Pressure: #{observation.pressure_mb}mb and #{pressure_trend}"
	puts "Winds: #{observation.wind_string}"
end

print_observation(get_observation)