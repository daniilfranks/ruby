def replace_var(text, var_name, value=nil)
	unless block_given? ^ value
		raise ArgumentError,
			"Either value or block must be given, but not both"
		end
	text.gsub!(/\{#{var_name}\}/) { value || yield }
end

p replace_var("Hello, {name}", 'name', 'Den')

text = "my {noun} is full of {noun}s"
result = replace_var(text, 'noun') {
	%w[hovercraft eel macaroon dreidel cabana parrot].sample
}
p result

text = "my {noun} is full of {noun}s"
result = replace_var(text, 'noun', 'test') {
	%w[hovercraft eel macaroon dreidel cabana parrot].sample
}
p result