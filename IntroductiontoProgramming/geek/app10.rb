class PersonalComputer
  attr_accessor :manufacturer,
    :model, :processor, :clock,
    :ram, :disk, :monitor,
    :colors, :vres, :hres, :net

  def initialize(&block)
    instance_eval &block;
  end

  # Other methods...

end

desktop = PersonalComputer.new do
  self.manufacturer = "Acme"
  self.model = "THX-1138"
  self.processor = "986"
  self.clock = 2.4        # GHz
  self.ram = 1024         # Mb
  self.disk = 800         # Gb
  self.monitor = 25       # inches
  self.colors = 16777216
  self.vres = 1280
  self.hres = 1600
  self.net = "T3"
end

p desktop


class Mathematics
  def Mathematics.add(operand_one, operand_two)
    return operand_one + operand_two
  end
end


puts "1 + 2 = " + Mathematics.add(1, 2).to_s


class Square
  def initialize(side_length)
    @side_length = side_length
  end

  def area
    @side_length * @side_length
  end
end

s = Square.new(10)
p s.area


class Square
  def initialize
    if defined?(@@number_of_squares)
      @@number_of_squares += 1
    else
      @@number_of_squares = 1
    end
  end

  def Square.count
    @@number_of_squares
  end
end

a = Square.new
puts Square.count
b = Square.new

puts Square.count
c = Square.new
puts Square.count