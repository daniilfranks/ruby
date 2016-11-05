class Gem::Commands::LoveCommand < Gem::Command
	def initialize
		super 'love', "Tell the world of your love for gem"
	end

	def arguments
		"GEM_NAME the name of the gem you wish to endorse"
	end

	def usage
		"#{program_name} GEM_NAME"
	end

	def description
		<<END 
Records you appreciation for a gem on gemlove.org
END

	def execute
		puts "Under construction..."
	end
end