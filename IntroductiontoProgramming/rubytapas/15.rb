#a = [:x, :y, :z]
#p a.fetch(3)

port = ENV.fetch('PORT'){ 8080 }.to_i
p port


config1 = {
	database: {
		type: 'mysql',
		host: 'localhost'
	}
}

config2 = {}

p config2.fetch(:database){{}}.fetch(:type){'sqlite'}


{}.fetch(:foo) do |key|
	puts "Missing key: #{key}"
end


default = ->(key) do 
	puts "#{key} not found, please enter it: "
end

h = {}
p name  = h.fetch(:name, &default)
p email = h.fetch(:email, &default)


h = {}
p h.fetch(:threads, 4)


def default
	42
end