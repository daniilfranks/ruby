class Game
	def initialize(slovo)
		@letters = get_letters(slovo)
		@errors = 0
		@bad_letters = []
		@good_letters = []
		@status = 0
	end

	def get_letters(slovo)
		if (slovo == nil || slovo == "")
			abort "Dont read write"
		end
		return slovo.split("")
	end

	def ask_next_letter
		puts "\n Enter the letter"

		letter = ""

		next_step(letter)
	end

	def next_letter(letter)
		if @status == -1 || @status == 1
			return
		end

		if @good_letters.include?(letter) || @bad_letters(letter)
			return
		end

		if @letters.include?(letter)
			@good_letters << letter

			if @good_letters.size == @letters.uniq.size
				@status = 1
			end
		else
			@bad_letters < letter
			@errors += 1

			if @errors >= 7
				@status = -1
			end
		end
	end
end