require 'open-uri'
require 'json'
require 'ostruct'

class TemperatureApiError < StandardError
end

DEFAULT_FALLBACK = ->(error) { raise }

def get_temp(query, &fallback)
	fallback ||= DEFAULT_FALLBACK
	url = "http://api.wunderground.com/api/d9b50ebd4c8bde25/conditions/q/#{query}.json"
	data = open(url).read
	JSON.parse(data)['current_observation']['temp_f']
rescue => error
	fallback.call(error)
end

get_temp("00000") {"N/A"}
get_temp("00000") do |error|
	raise TemperatureApiError, error.message
end