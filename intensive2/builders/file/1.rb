File.open('user.txt', 'r') do |f|
  while line = f.gets
    puts line
  end
end

File.open('user.txt', 'w') do |f|
  f.puts '1 Akbar 31 UFA'
  f.puts '2 Den 25 Kazan'
end

begin
    File.open('afirst.rb', 'r') do |f1|  
      while line = f1.gets  
         puts line  
      end  
    end  
rescue Exception => e  
  puts "Hej"
  puts e.message  
  puts e.backtrace.inspect  
end  


class Parent
  attr_reader :nisse

  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

class Child < Parent

    def self.nu
     return "hej"
    end
end

class Nisse < Parent
  def self.nu
     return "hoj hoj"
  end
end

puts Parent.descendants

Parent.descendants.each do | x |  puts x.nu end