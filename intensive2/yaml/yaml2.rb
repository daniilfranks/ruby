require 'yaml/store'

store = YAML::Store.new('users.yml')

store.transaction(true) do
	store.roots.each do |users|
		p store[users]
	end
end
