require 'date'
require 'delegate'

class User
	def born_on
		Date.new(1991,2,28)
	end

	def kalle
		p 'kalle'
	end
end

class UserDecorator < SimpleDelegator
	def birth_year
		self.__getobj__.born_on.year
	end

	def born_on
		p 'before'
		to_return = self.__getobj__.born_on
		p 'after'
		to_return
	end

	def kalle
		p 'before'
		to_return = self.__getobj__.kalle
		p 'after'
		to_return
	end
end

p user = User.new
p user.born_on
user.kalle
p '*'*45

p decorate_user = UserDecorator.new(User.new)
decorate_user.birth_year
p '*'*45
decorate_user.born_on
p '*'*45
decorate_user.kalle
p '*'*45
p decorate_user.__getobj__
