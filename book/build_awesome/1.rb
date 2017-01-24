FILE = 'task.txt'

param = case ARGV[0]

when 'new'
	new_task = ARGV[1]
	unless new_task == nil
		File.open(FILE, 'a') do |file|
			file.write("#{new_task}, #{Time.new}\n")
			puts 'Task added.'
		end
	else
		puts 'Enter task!!!'
	end
when 'list'
	if File.exist?(FILE)
		File.readlines(FILE).each do |file|
			puts file
		end
	end
else
	puts 'No valid comand'
end
