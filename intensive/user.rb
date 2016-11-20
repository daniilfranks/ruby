class User
  attr_reader :name, :age, :city, :role

  def initialize(name = nil, age = 0, city = nil, role = 0)
    @file = File.open('user.txt', 'a')
    @name = name
    @age  = age
    @city = city
    @role = role
  end

  def add_file
    user = "Name:#{@name}, Age:#{@age}, City:#{@city}, Role:#{@role}, Time:#{Time.now}"
    @file.puts(user)
  end
end

arr_name = []
arr_city = []

File.open('name.txt').each do |n|
  arr_name << n
end

File.open('city.txt').each do |n|
  arr_city << n
end

100.times do
  name = arr_name.sample
  age  = rand(18..65)
  city = arr_city.sample
  role = rand(1..5)
  user = User.new(name, age, city, role)
  user.add_file
end