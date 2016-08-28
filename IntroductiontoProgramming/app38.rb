dictionary = {'cat'=> 'кошка', 'dog'=>'собака', 'girl'=>'девушка'}

loop do
	puts "Enter the word"
	word = gets.strip

	translation = dictionary[word]
	puts "Translation: #{translation}"
end