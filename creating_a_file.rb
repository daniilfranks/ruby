=begin
save_file = File.new("teams.txt",'w+')
save_file.puts("Hi world")
save_file.close
=end

=begin
teams_one = File.read("teams.txt")
teams_two = File.read("teams2.txt")

teams_master = teams_one.split(', ') + teams_two.split(', ')

teams_master.each do |t|
  puts t.upcase
end

=begin
File.delete("teams3.txt")
=end

=begin
10.times do
	sleep 1
	puts "Record saved...."
	File.open("server_logs.txt", "a"){|f| f.puts "Server startedat: #{Time.new}"}
end
=end

=begin
def error_logger(e)
	File.open("error_log.txt", 'a') do |f|
		f.puts e
	end
end

begin
	puts 8/0
rescue StandardError => e
	error_logger("Error: #{e} at #{Time.now}")
end
=end