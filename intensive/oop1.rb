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

one = CoffeMachine.new
one.make_coffee
#one.get_start

class MachineCleaner < CoffeMachine
  def clean(machine)
    machine.get_start
    machine.get_water(200)
    machine.coffe_ready
  end
end

p machine_cleaner = MachineCleaner.new
p machine_cleaner.clean(one)
#p machine_cleaner.get_start