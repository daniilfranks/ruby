require 'yaml/store'

User = Struct.new(:name, :age, :city)
users = [User.new('Danila', 25, 'Kazan'),
				 User.new('Leon',   30, 'NY'),
				 User.new('Tony',   43, 'London')
				]

store = YAML::Store.new('users.yml')

store.transaction do 
	store['users'] = users
	store['date']  = Time.new
end
