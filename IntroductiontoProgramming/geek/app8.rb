class Animal
  attr_reader :color
  attr_writer :color

  def initialize(color)
    @color = color
  end
end


class Employee
 attr_reader :name
 attr_accessor  :title, :salary

 def initialize( name, title, salary )
   @name = name
   @title = title
   @salary = salary
 end
end

fred = Employee.new("Fred", "Operator", 30000.0)
puts fred.salary=35000.0