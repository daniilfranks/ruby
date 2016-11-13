module Cappucinator
  def create_foam
    prepare_milk
    push_foam
  end

  private

  def prepare_milk
    puts "Select and boil the milk"
  end

  def push_foam
    puts "We produce milk foam in the cup"
  end
end

module LatteArt
  private

  def push_foam
    puts "Beautiful patterns spread foam in the cup."
  end
end

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
  include Cappucinator
  include LatteArt

  def make_coffee
    super
    create_foam
  end
end

class CapsuleCappuccino < CoffeMachine
  include Cappucinator

  def make_coffee
    get_start
    get_water(200)
    prepare_capsule
    create_foam
    coffe_ready
  end

  protected

  def prepare_capsule
    puts "We reveal the capsule and fall asleep in the coffee container."
  end
end

p capsulecappucino = CapsuleCappuccino.new
p capsulecappucino.make_coffee
p "="*30
p cappuccinomachine = CappuccinoMachine.new
p cappuccinomachine.make_coffee