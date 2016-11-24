class Car
  require 'csv'

  attr_accessor :file_name

  def initialize(file_name)
    @file_name = file_name
  end

  def add_car(car_model, price, country)
    CSV.open(@file_name, 'a') do |write|
      write << ["#{car_model}, #{price}, #{country}"]
    end
  end
end

p bmw = Car.new('bmw.csv')
bmw.add_car('x5', 50000, 'Germany')
bmw.add_car('x3', 40000, 'Germany')