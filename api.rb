@city = {   "coord"=> {"lon"=>49.12, "lat"=>55.79}, 
						"weather"=>[{"id"=>804, "main"=>"Clouds", "description"=>"overcast clouds", "icon"=>"04d"}], 
						"base"=>"stations", 
						"main"=>{"temp"=>274.547, "pressure"=>998.65, 
							       "humidity"=>92, "temp_min"=>274.547, 
							       "temp_max"=>274.547, "sea_level"=>1013.61, 
							       "grnd_level"=>998.65}, 
						"wind"=>{"speed"=>9.52, "deg"=>251.5}, 
						"clouds"=>{"all"=>92}, 
						"dt"=>1487594329, 
						"sys"=>{"message"=>0.0024, "country"=>"RU", 
							      "sunrise"=>1487562921, "sunset"=>1487599197}, 
						"id"=>551487, 
						"name"=>"Kazan", 
						"cod"=>200
}

#p @city['main']['temp']

def coord
	"#{@city['coord']['lon']}, #{@city['coord']['lat']}"
end

def weather(units_temperature = 'k')
	case units_temperature
	when 'f' then (1.8 * (@city['main']['temp'] - 273.15) + 32).ceil(2)
	when 'c' then (@city['main']['temp'] - 273.15).ceil(2)
	else @city['main']['temp'].ceil(2)
	end
end
puts coord
p weather
p weather('c')
p weather('f')

p @city.has_key?('rain')

p Time.at(@city['dt'])
