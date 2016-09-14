class Animal
  def initialize(color)
    @color = color
  end

  def get_color
    return @color
  end
end

animal = Animal.new("brown")
puts "The new animal is " + animal.get_color


class Repeat
  @@total = 0
  def initialize( string, times )
    @string = string
    @times = times
  end
  def repeat
    @@total += @times
    return @string * @times
  end
  def total
    "Total times, so far: " + @@total.to_s
  end
end

data = Repeat.new( "a ", 8 )
ditto = Repeat.new( "A! ", 5 )
ditty = Repeat.new( "R. ", 2 )

puts data.repeat
puts data.total 

puts ditto.repeat
puts ditto.total 

puts ditty.repeat
puts ditty.total

class Account
  attr_reader :name, :balance

  def initialize(n, b)
    @name = n
    @balance = b
  end

  def add_interest(rate)
    @balance += @balance * rate / 100
  end

  def display
    printf("%s, you have $%5.2f in your account.\n",
            @name, @balance)
  end
end

my_account = Account.new("Barry", 10.00)
my_account.add_interest(5.0)
my_account.display

your_account = Account.new("Harriet", 100.00)
your_account.add_interest(7.0)
your_account.display