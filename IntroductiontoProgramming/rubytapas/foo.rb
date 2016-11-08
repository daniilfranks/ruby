def rfc822_to_json(input)
	headers = {}
	record_sep
	input.each_line(record_sep) do |line|
		fields = line.split(/:\s*/)
		break if fields.size < 2
		headers[fields[0]] = fields[1].chomp(record_sep)
	end
	JSON.prety_generate(headers)
end

if $PROGRAM_NAME == __FILE__
	rfc822_to_json($stdin)
end

puts "__FILE__: #{__FILE__}"
puts "$PROGRAM_NAME: #{$PROGRAM_NAME}"
puts "$0: #{$0}"