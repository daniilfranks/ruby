class Book
	attr_reader :last_person
	def initialize
		@hash = {}
		@last_person = ''
	end

	def add_hash options
		@last_person = options[:name]
		puts 'Already exists!' if @hash[options[:name]]
		@hash[options[:name]] = options[:age]
	end

	def show_hash
		@hash.each {|key, value| puts "Name: #{key}. Age:#{value}" }
	end
end

b = Book.new
b.add_hash :name => 'Den', :age => 25
b.add_hash :name => 'Jessie', :age => 31
b.add_hash :name => 'Walt', :age => 50
b.show_hash

puts "#{b.last_person}"