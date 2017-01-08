require 'minitest/autorun'
require 'user'

class TestUser < Minitest::Test
	def setup
		@user = User.new('Den', 25, 'Kazan')
	end

	def test_user_name
		assert(@user.name == 'Den')
	end

	def test_user_age
		assert(@user.age == 25)
	end

	def test_user_city
		assert(@user.city == 'Kazan')
	end

	def test_hello
		assert(@user.hello == "Hello Den, 25, Kazan")
	end
end
