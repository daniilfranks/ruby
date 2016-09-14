class Horse

  def name
    @name
  end

  def name=( value )
    @name = value
  end

end

h = Horse.new
p h.name = "Poco Bueno"


module MyModule
  def potato
    'A'
  end
end

module ModuleB
  def potato
    'B'
  end
end

class Potato
  include MyModule
  include ModuleB
end

puts Potato.new.potato 