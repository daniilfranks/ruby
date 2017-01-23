require 'minitest/autorun'

class Test < Minitest::Test
	def test_true
		assert(true)
	end

	def test_false
		assert(false)
	end

	def res
		assert(2 + 2 == 4)
	end
end