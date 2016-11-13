class CoffeMachine
  attr_accessor :cups_count

  def initialize(cups_count = 1)
    @cups_count = cups_count
  end

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

p one = CoffeMachine.new(2)
p one.make_coffee
p one.cups_count