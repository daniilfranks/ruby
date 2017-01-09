class NumberGuesser
  
  "Guesses numbers based on the history of your input"
  
  def initialize
    @guessed_numbers = []
  end

  def number_were(index, guessed_numbers)
    unless @guessed_numbers.include?(guessed_numbers) 
      @guessed_numbers[index] += guessed_numbers
    else
      'No index'
    end
  end

  def number_was(guessed_number)
    @guessed_numbers << guessed_number
  end

  def guess
    nil if @guessed_numbers == []

    @guessed_numbers.sample
  end
end

num = NumberGuesser.new
p num.guess
num.number_was(10)
num.number_was(30)
num.number_was(50)

num.number_were(1, 700)
p num

p num.guess
