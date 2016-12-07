module Bar
  def public_method 
    'Public method'
  end

  private

  def private_method
    'Private method'
  end
end

class Foo
  include Bar

  attr_accessor :name

  def initialize(name)
    @name  = name
    @age   = rand_age
    @array = []
  end

  private

  def rand_age
    rand(110)
  end
end

p foo = Foo.new('Den')
p foo.methods
p foo.class
p foo.instance_variables
