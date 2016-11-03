word_count = {}
text = <<END
I'm your only friend
I'm not your onlu friend
But I am
END

text.split.map(&:downcase).each do |word|
	word_count[word] ||= 0
	word_count[word] += 1
end

p word_count