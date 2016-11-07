text = <<END
	First string den@host1.ru
	Email: noname@blog.com
END

EMAILL_PATTERN = /\S+@\S+/i

email = []
while(match = EMAILL_PATTERN.match(text))
	email << match[0]
	text = match.post_match
end
p email


text = <<END
	First string den@host1.ru
	Email: noname@blog.com
END

EMAILL_PATTERN2 = /(\S+)@(\S+)/i

text.scan(EMAILL_PATTERN2) do |name, host|
	puts "Name: #{name}, host: #{host}"
end