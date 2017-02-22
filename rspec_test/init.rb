require './lib/car.rb'

bmw = Car.new(make: 'bmw', year: '2017', color: 'blue')
p bmw
p bmw.full_name

audi = Car.new
p audi.make = 'Audi'

# rspec
# rspec --color
# rspec --format documentation
# rspec spec/car_spec.rb -fd --color
# rspec spec/car_spec.rb --format documentation
# rspec spec/car_spec.rb --format documentation --color

# rspec --order random --color
# rspec --profile
# rspec --fail-fast
# rspec spec/car_spec.rb:34

# rspec spec/expection_matchers_spec.rb --color
