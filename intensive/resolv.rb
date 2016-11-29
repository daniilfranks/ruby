require 'resolv'

p Resolv.getaddress('github.com')
p Resolv.getname('192.30.253.112')

def getname(ip)
  p Resolv.getname(ip)
rescue Resolv::ResolvError => e
  p e
end

getname('192.30.253.113')

def valid_ip(ip)
  case ip
  when Resolv::IPv4::Regex
    puts 'valid ipv4'
  when Resolv::IPv6::Regex
    puts "valid ipv6"
  else
    puts "not a valid ip"
  end
end

valid_ip('999.999.999.999')
valid_ip('191.1.1.1')
valid_ip('2001:0db8:11a3:09d7:1f34:8a2e:07a0:765d')