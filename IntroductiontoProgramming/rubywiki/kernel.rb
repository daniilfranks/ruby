p sprintf "%.1f", 1.12345
p sprintf "%.2f", 1.12345
p sprintf "%.3f", 1.12345

p Array(1..5)
p Array("a".."e")

p Integer(12.12)
p String(12)
p Float(12)

def try
	if block_given?
		yield
	else
		"no block"
	end
end

p try
p try { "hello" }

p rand
p rand(1..10)

#require "string.rb"