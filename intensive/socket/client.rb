require "socket"

s = TCPSocket.open("localhost", 2000)
while line = s.gets
    puts line
end
s.close