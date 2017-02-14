User = Struct.new(:name, :age)
den = User.new('Den', 25)
p den

Struct.new('People', :name, :age)
leo = Struct::People.new('Leo', 30)
p leo

Admin = Struct.new(:name, :age) do 
	def to_s
		"#{name}, #{age}"
	end
end
asd = Admin.new('Asd', 18)
p asd
p asd.to_s
