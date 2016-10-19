=begin
struct = Struct.new("Customer", :name, :address)
struct = Struct::Customer.new("Den","123 Main")
p struct
p struct.class
p struct.object_id
#p struct.methods

Customer = Struct.new(:name, :address)
struct = Customer.new("Den","123 Main")
p struct
p struct.class
p struct.object_id
=end
#"================================================"
Customer = Struct.new(:name, :address, :zip) do
	def greeting
		"Hello #{name}!"
	end
end

den  = Customer.new("Den", "123 Main", 12345)
den2 = Customer.new("Den", "123 Main", 12345)

p den
p den.greeting
p den == den2
p den.name
p den.name = "Danila"
p den[:name]
p den["name"]
p den[0]
p den.address
p den.zip
p "="*20
den.each { |i| puts i }
den.each_pair { |k,v| puts "#{k} => #{v}" }
p den.length
p den.members