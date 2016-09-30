#bastardsbook.com
#learnrubythehardway.org

=begin
for row_num in 1..9
   line = ""
   for col_num in 1..9
      line += "#{row_num * col_num}\t"
   end
   
   puts line
end

(1..9).each do |row_num|
   line = ""
   (1..9).each{ |col_num| line += "#{row_num * col_num}\t"}
   
   puts line
end
=end

def print_two(*args)
  arg1, arg2 = args
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

print_two("first","two")
print_two("first")

puts "a".ord
puts "A".ord
puts "b".ord
puts "B".ord


#присвоит значение переменной если оно не было задано
string = "true"
p string ||= "new"

string = nil
p string ||= "new"

def get_raise
  puts "Error puts"
  raise "Error raise!"
end

#get_raise

#begin end
#rescue

