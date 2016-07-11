class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  public    # This method can be called from outside the class.
  
  def about_me
    puts "I'm #{@name} and I'm #{@age} years old!"
  end
  
  private   # This method can't!
  
  def bank_account_number
    @account_number = 12345
    puts "My bank account number is #{@account_number}."
  end
end

=begin
eric = Person.new("Eric", 26)
eric.about_me
eric.bank_account_number
=end

class Dog
    def initialize(name, breed)
      @name = name
      @breed = breed
    end

    public
    def bark
        puts "Woof!"
    end

    private
    def id
      @id_number = 12345
    end
end


class Person
  def initialize(name, job)
   attr_reader :name
   attr_writer :job
   end
  
  def name
    @name
  end
  
  def job=(new_job)
    @job = new_job
  end
end

class Persons
  attr_accessor :name
  attr_accessor :job
  attr_accessor :job
  
  def initialize(name, job)
    @name = name
    @job = job
  end
end

module Circle

  PI = 3.141592653589793
  
  def Circle.area(radius)
    PI * radius**2
  end
  
  def Circle.circumference(radius)
    2 * PI * radius
  end
end

module MyLibrary
  FAVE_BOOK = "sofi"
end

module Math
  def self
    PI
  end
end

require 'date'
puts Date.today


class Angle
  include Math
  attr_accessor :radians
  
  def initialize(radians)
    @radians = radians
  end
  
  def cosine
    cos(@radians)
  end
end

acute = Angle.new(1)
acute.cosine


module Action
  def jump
    @distance = rand(4) + 2
    puts "I jumped forward #{@distance} feet!"
  end
end

class Rabbit
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class Cricket
  include Action
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

peter = Rabbit.new("Peter")
jiminy = Cricket.new("Jiminy")

peter.jump
jiminy.jump


module MartialArts
    def swordsman
        puts "I'm a swordsman"
    end
end

class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end

module ThePresent
  def now
    puts "It's #{Time.new.hour > 12 ? Time.new.hour - 12 : Time.new.hour}:#{Time.new.min} #{Time.new.hour > 12 ? 'PM' : 'AM'} (GMT)."
  end
end

class TheHereAnd
  extend ThePresent
end

TheHereAnd.now


class Application
  attr_accessor :status
  def initialize; end
    public
    def print_status
        puts "All systems go!"
    end

  private

  def password
      secret_password = 12345
  end
  end

module Languages
  FAVE = "Ruby"  # This is what you typed before, right? :D
end

class Master
    include Languages
  def initialize; end
  def victory
    puts FAVE
  end
end

total = Master.new
total.victory