str = 12
p str.to_s  #"12"

str1 = "Carl"
str2 = "Leo"
str3 = "Help and documentation for the Ruby programming language."
p str1 + " " + str2 #"Carl Leo"
p "#{str1} #{str2}" #"Carl Leo"
p "#{str1} " * 5 #"Carl Carl Carl Carl Carl "
p str1.size #4
p str3[0..3] #"Help"
p str3[0...4] #"Help"
p str3[-9...-1] #"language"
p str1.reverse #"lraC"

str4 = "HELLO" 
p str4.capitalize #"Hello"
str5 = "hELLO" 
p str5.downcase #"hello"
p str5.empty? #false
p str5.insert(-1, " world") #"hELLO world"

p 5+5 #10
p 10-5 #5
p 7*2 #14
p 16/4 #4
p 15%4 #3
p 8%3 #2
p 9**7 #4782969
p 8**8 #16777216
p 9**3 #729
p 5+5*2 #15
p (5+5)*2 #20
p 6.0+4 #10.0
p 10-2.0 #8.0
p 6.0/3 #2.0
p 9**3.0 #729.0
p 6 & 4    #4 
p 6 | 4    #6 
p 6 ^ 4    #2 
p 6 << 4   #96
p 6 >> 4   #0
p ~4       #-5

p 10.to_f #10.0
p 5.3.to_i #5
p 8.to_s   #"8"
p rand     #0.02431191107996722
p rand(1..100) #4

p Time.new
p Time.new(2020,12,31,12,45,0, "+04:00")
p Time.new.sunday?
p Time.new.monday?
p Time.new.tuesday?
p Time.new.wednesday?
p Time.new.thursday?
p Time.new.friday?
p Time.new.saturday?
p Time.new.year
p Time.new.month
p Time.new.day
p Time.new.hour
p Time.new.min
p Time.new.sec

t=Time.new
t2 = t + 2592000
p t
p t2



































































































































