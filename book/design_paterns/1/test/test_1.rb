#gem install minitest
require 'minitest/autorun'
require_relative '../1'

class TestCar < Minitest::Test
	def setup
		@car = Car.new
	end

	def test_drive
		assert_instance_of(Class, @car.class)
		assert(@car.class.name == 'Car')
		assert_equal(@car.drive(100), 100)
	end
end
