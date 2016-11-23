class User
  attr_accessor :login, :age, :city, :create_at

  def initialize(login = 'Default', age = 0, city = 'Default', create_at = Time.new)
    @login     = login
    @age       = age
    @city      = city
    @create_at = create_at
  end

  def method1
    "Hi private method: #{secret1}"
  end

  def method2
    secret2
  end

  def method3
    protected_method1
  end

  def method4
    self.protected_method2.object_id
  end

  protected

  def protected_method1
    'protected_method1'
  end

  def protected_method2
    'protected_method2'
  end

  private

  def secret1
    'secret'
  end

  def secret2
    'secret'
  end
end

p den = User.new('boban', 25, 'Kazan')
p den.method1
p den.method2
p den.method3
p den.method4
#p den.secret