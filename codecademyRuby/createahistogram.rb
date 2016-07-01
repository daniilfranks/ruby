puts "please text"
text = gets.chomp

words = text.split
frequencies = Hash.new(0)

words.each {|word| frequencies[word] += 1}
frequencies = frequencies.sort_by {|a, b| b}
frequencies.reverse!
frequencies.each do |word, frequency|
  puts word + " " + frequency.to_s
end

str = "i love you ruby, i dont love php. ruby"
words = str.scan(/\w+/)
hash = Hash.new(0)
words.each {|w| hash[w] += 1}
hash = hash.sort_by{|b, a| puts "#{b}: #{a}"}.reverse
