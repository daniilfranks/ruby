class Game
  attr_reader :grid, :player1, :player2

  @@wining_combo = [
                    [0, 1, 2], [0, 3, 6], [0, 4, 8], [1, 4, 7],
                    [2, 4, 6], [2, 5, 8], [3, 4, 5], [6, 7, 8]
                   ]

  def initialize
    @grid = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @winner = nil
    @current_turn = 1
  end

  def play
    get_players_names
    show_welcome_message
    start_playing
    show_result
    show_game_over_message
  end

  protected

  def get_players_names
    puts 'Enter player1 name: '
    @player1.name = gets.strip
    @player1.sym  = 'x'
    puts 'Enter player2 name: '
    @player2.name = gets.strip
    @player2.sym  = 'o'
  end

  def show_welcome_message
    puts 'Welcome to my TicTacToe Game!!'
    @grid.print_grid
  end

  def start_playing
    take_turns until game_over
  end

  def take_turns
    @current_turn.even? ? turn(@player1) : turn(@player2)
  end

  def turn(player)   
    show_turn(player)
    input = get_valid_cell
    if @grid.update(input, player.sym) 
      @current_turn += 1
    else
      error = "SORRY, THAT CELL IS INVALID"
    end
    @grid.print_grid
    puts error
    check_for_win(player)
  end

  def show_turn(player)
    puts "Turn: #{@current_turn}"
    print "#{player.name} ('#{player.sym}') "
  end

  def get_valid_cell
    input = nil
    until (0..8).include?(input)
      print 'enter your move (1-9) top to bottom, left to right: '
      input = gets.chomp.to_i - 1 # array is indexed 0-8; positions are 1-9
    end
    input
  end

  def check_for_win(player)
    @@wining_combo.each do |w|
      @winner = player if w.all? { |a| @grid.board[a] == player.sym }
    end    
  end

  def game_over
    @current_turn > 9 || @winner
  end

  def show_game_over_message
    puts 'Game Over'
  end

  def show_result
    if @current_turn > 9 && !@winner
      puts "IT'S A TIE!s"
    else
      puts "CONGRATS, #{@winner.name}.  YOU WON!"
    end
  end

  class Board
    attr_reader :board, :empty_cell
    
    def initialize
      @empty_cell = '-' # default value for empty cells
      @board = Array.new(9, @empty_cell)
    end

    def print_grid # prints 3 X 3 grid with values
      puts "\n"
      @board.each_slice(3) { |row| puts row.join(' | ') }
      puts "\n"
    end

    def update(pos, sym)
      if @board[pos] == @empty_cell
        @board[pos] = sym
        return true
      else
        return false
      end
    end
  end

  Player = Struct.new(:name, :sym)
end

game = Game.new
game.play
