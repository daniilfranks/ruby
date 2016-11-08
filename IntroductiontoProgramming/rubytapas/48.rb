class Dictionary
	def initialize(dict_path)
		@dict_path = dict_path
	end

	def anagrams_for(word)
		@memoized_anagrams ||= {}
		if @memoized_anagrams.key?(word)
			return @memoized_anagrams
		end
		results = word.downcase.chars.to_a.permutation.select do |perm|
			perm_word = perm.join
			IO.foreach(@dict_path).any?{|dict_word|
				dict_word.downcase.chomp == perm_word.downcase
			}
		end.map(&:join).uniq
		@memoized_anagrams[word] = results
	end
end

dict = Dictionary.new('/usr/share/dict/words')
require 'benchmark'

Benchmark.bm do |bm|
	bm.report("1st call:") { dict.anagrams_for("den") }
	bm.report("2nd call:") { dict.anagrams_for("den") }
end