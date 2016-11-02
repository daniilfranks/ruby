module Live_Cell
	def to_s() 'o' end

	def self.next_generation(x, y, board)
		case board.neighbors(x,y).count(Live_Cell)
		when 2..3 then self
		else Dead_Cell
		end
	end
end

module Dead_Cell
	def self.to_s() '.' end

	def self.next_generation(x, y, board)
		case board.neighbors(x,y).count(Live_Cell)
		when 3 then Live_Cell
		else self
		end
	end
end

puts [ [Dead_Cell, Live_Cell, Dead_Cell, Live_Cell] ]