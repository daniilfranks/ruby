require 'minitest/autorun'
require 'user'

class TestUser < Minitest::Test
	# Метод запускается перед каждым тестом
	def setup
		@user = User.new('Den', 25, 'Kazan')
		@user.add_items('cat', 'dog')
	end

	# Метод вызывается после каждого теста
	def teardown
		# Пример закрыть дб
		# db.close
	end

	def test_user_name
		assert(@user.name == 'Den')

		# Проверка на экземпляр класса
		assert_instance_of(String, 'Den')
	end

	def test_user_age
		assert(@user.age == 25)
		assert_instance_of(Fixnum, 25)
	end

	def test_user_city
		assert(@user.city == 'Kazan')
	end

	def test_hello
		assert(@user.hello == 'Hello Den, 25, Kazan')
	end

	def test_add_items
		assert(@user.items == [['cat', 'dog']])
	end

	# Простое сравнение 2 условий
	# def test_show_items
	# 	assert(@user.show_items == 'cat, dog')
	# end

	# Простое сравнение 2 условий
	def test_show_items
		assert_equal(@user.show_items, 'cat, dog')
	end

	# Поиск объекта в масиве
	def test_items_includes
		@user.add_items('car')
		assert_includes(@user.items, ['car'])
	end
end
