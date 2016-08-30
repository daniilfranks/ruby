loop do 
	puts "R,S,P"
	r = gets.strip.capitalize

	if r == "R"
		user_res = :r
	elsif r == "S"
		user_res = :s
	elsif r == "P"
		user_res = :p
	else
		puts "Error!!!"
		break
	end

	arr = [:r,:s,:p]
	comp_res = arr.sample


	matrix = [
		[:r,:s,:win_user],
		[:r,:p,:win_pc],
		[:r,:r,:drow],

		[:s,:r,:win_pc],
		[:s,:p,:win_user],
		[:s,:s,:drow],

		[:p,:r,:win_user],
		[:p,:s,:win_pc],
		[:p,:p,:drow]
	]

	matrix.each do |m|
		if m[0] == user_res && m[1] == comp_res
			if m[2] == :win_user
				puts "Win user"
			elsif m[2] == :win_pc
				puts "Win pc"
			else
				puts "Drow"
			end
		end
	end
end