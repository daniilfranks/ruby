puts "Enter you name"
name = gets.strip.chomp.capitalize

if name == ""
	name = "Anonymous"
end

questions = ["Question 1", "Question 2", "Question 3", "Question 4", "Question 5",]
results = ["Good", "Normal", "Bad"]

yes_answers = 0
no_answers = 0

for item in questions do 
	puts item
	user_input = nil
	while (user_input != "yes" and user_input != "no")
		puts "Введите yes или no и нажмите Ввод"
		user_input = STDIN.gets.chomp.downcase #Yes NO
	end
	if (user_input == "yes")
		yes_answers += 1
	end
	if (user_input == "no")
		no_answers += 1
	end		
end

puts "\n#{name}"

puts "\nВаш резальтат теста (ответов да - #{yes_answers};ответов нет - #{no_answers})"

if (yes_answers >= 5)
	puts results[0]
elsif (yes_answers >= 2)
	puts results[1]
else 
	puts results[2]
end