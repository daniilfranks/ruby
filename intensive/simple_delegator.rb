require 'date'

class User
  def born_on
    Date.new(1991, 2, 28)
  end
end

class UserDecorator < SimpleDelegator
  def birth_year
    born_on.year
  end
end

decorated_user = UserDecorator.new(User.new)
p decorated_user.birth_year
p decorated_user.__getobj__