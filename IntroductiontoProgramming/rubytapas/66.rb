require 'open-uri'
require 'json'

class Weather
	Report = Struct.new(:temperature)

	def initialize(options={})
		@cache = options.fetch(:cache) { {} }
	end

	def report(query)
		url = "http://api.wunderground.com/api/d9b50ebd4c8bde25/conditions/q/#{query}.json"
		body = @cache.fetch(query){
			@cache[query] = open(url).read
		}
		data = JSON.parse(body)
		Report.new(data['current_observation']['temp_c'])
	end
end

p Weather.new.report('Russia/Kazan')