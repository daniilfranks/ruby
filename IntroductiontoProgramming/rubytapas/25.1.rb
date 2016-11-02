require 'ostruct'

observation = {
	'temp_f'         => 49.0,
	'pressure_trend' => '-',
	'pressure_mb'    => 981,
	'wind_string'    => "From the North at 3.0 MPH"
}

os = OpenStruct.new(observation)
p os.temp_f
p os.wind_string

os.my_city = 'Kazan'
p os.my_city

p os