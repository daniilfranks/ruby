=begin
class Point
	#def initialize(x,y)
	#	@x, @y = x, y
	#end
	def self.my_new(*args, &block)
		instance = allocate
		instance.my_initialize(*args, &block)
	end

	def my_initialize(x,y)
		@x, @y = x, y
	end
end

point = Point.new(88,999)
p point
=end

class User
	attr_accessor :email_address, :first_name, :last_name, :token

	def initialize(email_address, first_name, last_name, token)
		@email_address = email_address
		@first_name    = first_name
		@last_name     = last_name
		@token         = token
	end
end


auth = {
	'uid'  => 12345,
	'info' => {
		'email'      => 'den@test.com',
		'first_name' => 'Den',
		'last_name'  => 'Bob'
	},
	'credentials' => {
		'token' => 'token123'
	}
}

u = User.new(:email_address, :first_name, :last_name, :token)
u.email_address = auth['info']['email']
u.first_name    = auth['info']['first_name']
u.last_name     = auth['info']['last_name']
u.token         = auth['credentials']['token']