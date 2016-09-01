def show_book book
	puts "==========================="
	book.each {|key, value| puts "Name: #{key}. Age:#{value}" }
end

book1 = {'Den' => 34, 'Gus' => 56, 'Linda' => 29}
show_book book1
book2 = {'Jok' => 28, 'Dread' => 76, 'Morgan' => 23}
show_book book2

book = book1.merge book2
show_book book