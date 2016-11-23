=begin 
Декоратор (англ. Decorator) — структурный шаблон проектирования, 
предназначенный для динамического подключения дополнительного поведения 
к объекту.
=end

User = Struct.new(:first_name, :last_name)

require 'forwardable'

class DecoratedUser
  extend Forwardable
  
  def_delegators :@user, :first_name, :last_name

  def initialize(user)
    @user = user
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end

p den = User.new('Den', 'Bob')
decorated_user = DecoratedUser.new(den)
p decorated_user.full_name
p decorated_user.first_name
p decorated_user.last_name