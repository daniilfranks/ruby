#r = File.open("appread.txt",'r')
#w = File.open("appwrite.txt",'w+')

w = File.open("appwrite.txt",'a')
w.write "Hi file\n"
w.close

r = File.open("appwrite.txt",'r')

while (line= r.gets)
	puts line
end

r.close