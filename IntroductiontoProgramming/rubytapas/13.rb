LIVE_CELL = Object.new
class << LIVE_CELL
	def to_s() 'o' end

	def next_generation(x, y, board)
		case board.neighbors(x,y).count(LIVE_CELL)
		when 2..3 then self
		else DEAD_CELL
		end
	end
end

DEAD_CELL = Object.new
class << DEAD_CELL
	def to_s() '.' end

	def next_generation(x, y, board)
		case board.neighbors(x,y).count(LIVE_CELL)
		when 3 then LIVE_CELL
		else self
		end
	end
end

puts [ [DEAD_CELL, LIVE_CELL, DEAD_CELL, LIVE_CELL] ]