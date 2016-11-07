text = <<END
I,m your only friend
I,m not your onlu frind
But I am
END

#word_count = Hash.new do |hash, missing_key|
#	hash[missing_key] = 0
#end

word_count = Hash.new(0)

text.split.map(&:downcase).each do |word|
	word_count[word] += 1
end

p word_count

h = Hash.new{ |h,k| h[k] = [] }
h['name'] << 'leo'
h['name'] << 'mark'
h['name'] << 'alex'
h['age'] << 25

p h