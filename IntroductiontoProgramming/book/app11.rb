age = 17
puts "False" if age < 18

p "A".ord
p "a".ord

#require_relative 'app10'

begin 
  puts 10 / 0 
rescue 
  puts "You caused an error!" 
end 


class User

  def say_secret_with_self
    self.secret
  end

  protected

  def secret
    "secret"
  end
end

u = User.new
u.say_secret_with_self # => "secret"