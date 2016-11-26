require 'ipaddr'

ip = IPAddr.new('192.1.1.1')

p ip
p ip.to_s

=begin
print "Enter ip adress: "
validip = gets.strip

begin
  IPAddr.new(validip)
  puts 'valid address'
rescue StandardError => e
  puts e
end
=end

ip = 'Text. 999.999.999.999 text, 192.1.1.1111, text 192.1.1.11 text 168.1.1.1'
ip = ip.scan(/\b(?:\d{1,3}\.){3}\d{1,3}\b/)

valid = []
error = []

ip.each do |ip| 
  begin
    IPAddr.new(ip)
    valid << ip
  rescue StandardError => e
    error << "#{ip}, #{e}"
  end
end

p valid
p error