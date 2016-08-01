ANSWERS_FILE_PATH = "#{File.dirname(__FILE__)}/data/answers.txt"

GREETING_FILE_PATH = "#{File.dirname(__FILE__)}/data/greeting.txt"


begin
file_answers = File.open(ANSWERS_FILE_PATH)
rescue Errno::ENOENT => e
  puts "File not found answers"
  abort e.message
end

answers_lines = file_answers.readlines
file_answers.close

begin
file_greeting = File.open(GREETING_FILE_PATH)
rescue Errno::ENOENT => e
  puts "File not found answers"
  abort e.message
end

greeting_lines = file_greeting.readlines
file_greeting.close

sleep 1 

puts greeting_lines.sample

sleep 3

puts

puts answers_lines.sample