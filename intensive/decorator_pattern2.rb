User = Struct.new(:first_name, :last_name, :city)

require 'delegate'

class DecoratedUser < SimpleDelegator
  def full_name
    "#{first_name} #{last_name}"
  end

  def greeting
    "Hi, I'm #{first_name}! I live in #{city}"
  end
end

p den = User.new('Den', 'Bob', 'Kazan')
decorated_user = DecoratedUser.new(den)
p decorated_user.full_name
p decorated_user.first_name
p decorated_user.last_name
p decorated_user.greeting