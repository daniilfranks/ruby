=begin
Singleton (одиночка) — паттерн программирования позволяющий создавать 
такие классы, которые могут иметь только один экземпляр.
=end

require 'singleton'

class SuperClass
  include Singleton

  def hello
    puts "Hello, my id is #{object_id}"
  end
end

puts first = SuperClass.instance
puts first.hello

puts second = SuperClass.instance
puts second.hello


class User
  include Singleton

  def name(name)
    puts "My name #{name}!"
    puts "#{object_id}"
  end
end

puts den = User.instance
puts den.name('Den')

puts leo = User.instance
puts leo.name('Leo')