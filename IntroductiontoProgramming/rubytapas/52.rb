class Player
	attr_accessor :name, :level_completed, :tokens_collected

	def initialize(attributes={})
		attributes.each do |key, value|
			public_send("#{key}=", value)
		end
	end

	def record_high_score(storage=HighScoreFile.new("~/.highscores"))
		score = (level_completed * 100) + (tokens_collected * 10)
		storage.save_score(name, score)
	end
end

class HighScoreFile
	def initialize(filename)
		@filename = filename
	end

	def save_score(player_name, score)
		File.open(@filename, 'a') do |file|
			file.puts("#{player_name}: #{score}")
		end
	end
end