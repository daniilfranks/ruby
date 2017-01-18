require 'yaml/store'

users = [['Danila', 25, 'Kazan'], ['Leon',   30, 'NY'], ['Tony',   43, 'London']]

store = YAML::Store.new('users.yml')

store.transaction do 
	store['users'] = users
	store['date']  = Time.new
end
