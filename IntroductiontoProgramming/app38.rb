dictionary = {'cat'=> ['кошка','кот'], 'dog'=>['собака','пес'], 'girl'=>['девушка']}

loop do
	puts "Enter the word"
	word = gets.strip

	if word == ""
		break
	end

	unless dictionary[word]
		puts "No word!!!"
		break
	end

	translation = dictionary[word]
	puts "Translation:(#{translation.size}) #{translation}"
end
