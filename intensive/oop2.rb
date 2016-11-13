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

class CappuccinoMachine < CoffeMachine
  def make_coffee
    super
    prepare_milk
    push_foam
  end

  protected

  def prepare_milk
    puts "Select and boil the milk"
  end

  def push_foam
    puts "We produce milk foam in the cup"
  end
end

p one = CappuccinoMachine.new
p one.make_coffee