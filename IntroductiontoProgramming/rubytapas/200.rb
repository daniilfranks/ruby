class Feet
  attr_accessor :magnitude

  def initialize(magnitude)
    @magnitude = magnitude.to_f
  end

  def to_s
    "#{@magnitude} feet"
  end

  def +(other)
    Feet.new(@magnitude + other.magnitude)
  end
end

class Altimeter
  def initialize(value)
    raise TypeError unless Feet === value
    @value_in_feet = value
  end

  def change_by(change_amount)
    raise TypeError unless Feet === change_amount
    old_value = @value_in_feet
    @value_in_feet += change_amount
    puts "Altitude changed from #{old_value} to #{@value_in_feet}"
  end
end

puts alt = Altimeter.new(Feet.new(10_000))
puts alt.change_by(Feet.new(-600))