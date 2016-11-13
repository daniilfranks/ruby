class CoffeMachine
  def make_coffee
    get_start
    get_water(200)
    get_beans(50)
    coffe_ready
  end

  protected

  def get_start
    puts "Start"
  end

  def coffe_ready
    puts "Coffee ready!"
  end

  def get_water(mls)
    puts "Water #{mls}mls."
  end

  def get_beans(grams)
    puts "Beans #{grams}grams."
  end
end

class CapsuleMachine < CoffeMachine
  def make_coffee
    get_start
    get_water(200)
    prepare_capsule
    coffe_ready
  end

  protected

  def prepare_capsule
    puts "We reveal the capsule and fall asleep in the coffee container."
  end
end

p capsulemachine = CapsuleMachine.new
p capsulemachine.make_coffee