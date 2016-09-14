class Dog
  attr_reader :bark
  attr_writer :bark
end

dog = Dog.new

dog.bark="Woof!"
puts dog.bark


class Employee
      attr_reader :name
      def initialize(name)  
            @name = name 
      end
end

employee1 = Employee.new("Aneesha")

puts employee1.name


class Song 
	attr_reader :name, :artist, :duration

    def initialize(name, artist, duration) 
        @name = name 
        @artist = artist 
        @duration = duration 
    end  
end 

song = Song.new("A", "B", 6) 
puts song.artist 
puts song.name  
puts song.duration 