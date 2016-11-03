word_count = Hash.new{ |h,k| h[k] = 0 }
text = <<END
I'm your only friend
I'm not your onlu friend
But I am
END

text.split.map(&:downcase).each do |word|
	word_count[word] += 1
end

p word_count


config = Hash.new do |hash, key|
	hash[key] = Hash.new(&hash.default_proc)
end

config[:production][:db][:adapter] = 'mysql'
p config