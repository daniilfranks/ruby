=begin
VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

def is_valid_email? email
  email =~ VALID_EMAIL_REGEX
end

p is_valid_email?("den@google.com") ? "Valid"  :  "Invalid"  
p is_valid_email?("dengoogle.com") ? "Valid"  :  "Invalid"
p is_valid_email?("den.b@google.com") ? "Valid"  :  "Invalid"
p is_valid_email?("den@google ") ? "Valid"  :  "Invalid"
=end

=begin
IP_ADDRESS_REGEX = /^((?:(?:^|\.)(?:[1-9]\d|1\d{2}|2[0-4]\d|25[0-5])){4})$/ 

def is_valid_ip_address? ip
  ip =~ IP_ADDRESS_REGEX
end

p is_valid_ip_address?("999.16.0.0") ? "Valid" : "Invalid"
p is_valid_ip_address?("172.16.0.0") ? "Valid" : "Invalid"
p is_valid_ip_address?("172.31.255.255") ? "Valid" : "Invalid"
p is_valid_ip_address?("172.31.255.256") ? "Valid" : "Invalid"
=end

