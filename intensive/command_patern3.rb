class BaseCommand
  attr_reader :hero

  def initialize(hero)
    @hero = hero
  end

  def execute
    raise 'Method execute must be implemented!'
  end
end

class GetMoneyCommand < BaseCommand
  MONEY_VALUE = 100

  def execute
    @hero.money += MONEY_VALUE
  end

  def unexecute
    @hero.money -= MONEY_VALUE
  end
end

class HealCharacter < BaseCommand
  HEALTH_VALUE = 5

  def execute
    @hero.health += HEALTH_VALUE
  end

  def unexecute
    @hero.health -= HEALTH_VALUE
  end
end

class Hero
  attr_reader   :name
  attr_accessor :health, :money

  def initialize(name, health = 100, money = 800)
    @name   = name
    @health = health
    @money  = money
  end

  def info
    "Name: #{@name}, health: #{@health}, money: #{@money}"
  end

  def print_info
    p info
  end
end

class Turn
  def initialize
    @moves = []
  end

  def make_move(move)
    move.execute
    @moves << move
  end

  def undo_move
    @moves.pop.unexecute
  end
end

hero  = Hero.new('Spartak')
turn  = Turn.new
money = GetMoneyCommand.new(hero)
heal  = HealCharacter.new(hero)

hero.print_info

turn.make_move(money)
turn.make_move(heal)

hero.print_info

turn.undo_move

hero.print_info

turn.undo_move

hero.print_info