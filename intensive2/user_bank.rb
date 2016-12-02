require 'delegate'

module Role
  attr_accessor :role

  def initialize(role = 1)
    @role = role
  end

  def my_role
    "My role: #{@role}"
  end
end

module SocialNetwork
  class Vk < SimpleDelegator
    attr_accessor :uid

    def initialize(uid)
      @uid = rand(1000)
      super
    end
  end

  class Facebook < SimpleDelegator
    attr_accessor :uid

    def initialize(uid)
      @uid = rand(1000)
      super
    end
  end
end

module BankAccount
  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def rest
    @balance = 0
  end

  def transfer(amount, user)
    if @balance > amount
      @balance -= amount
      user.balance += amount
    else
      puts 'Not enough money!'
    end
  end
end

class User
  include Role
  include BankAccount

  attr_accessor :name, :age, :email

  def initialize
    @name  = 'Default'
    @age   = 25
    @email = 'default@gmail.com'
    super
  end

  def info
    "#{@name}, #{@age}"
  end
end

p u1 = User.new
p u1.name     = 'Den'
p u1.age      = 26
p u1.email    = 'babanovs@gmail.com'
p u1.my_role
p u1.role     = 1
p u1.info
p u1.balance  = 15000
p u1.deposit(1000)
p u1.withdraw(4000)

=begin
p vk1 = SocialNetwork::Vk.new(u1)
p vk1.uid
p vk1.name
p vk1.age
p vk1.email
p vk1.role
p vk1.info

p fb1 = SocialNetwork::Facebook.new(u1)
p fb1.uid
p fb1.name
p fb1.age
p fb1.email
p fb1.role
p fb1.info
=end

p u2 = User.new
p u2.name    = 'Leo'
p u2.age     = 31
p u2.email   = 'leo@gmail.com'

p '='*30

p u2.balance = 11000
p u1.balance

p '='*30

p u2.transfer(2000, u1)
p u2.transfer(20000, u1)

p '='*30

p u2.balance
p u1.balance

p u1.rest
p u1.balance