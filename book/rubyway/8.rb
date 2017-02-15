require 'ostruct'

user = OpenStruct.new
p user.name = 'Den'
p user.age  = 25
p user

people = OpenStruct.new(name: 'Leo', age: 30)
p people
p people.name
p people.age

hash = { name: 'Fail', age: 31 }
foo = OpenStruct.new(hash)
p foo
p foo.name
p foo.age

Bar = Struct.new(:name, :age)
jok = Bar.new('Jok', 45)
p jok
p jok.name
p jok.age
