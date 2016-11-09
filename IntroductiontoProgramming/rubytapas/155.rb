require 'table_print'
require 'ostruct'

def show_matches(strings, regexp, captures: false)
	matches = strings.map.with_index{ |title, index|
		matches = []
		string = title
		while match = regexp.match(string)
			matches << match
			string = match.post_match
		end
		OpenStruct.new({
			num: index+1,
			string: title,
			matches: matches
			})
	}
	if captures
		tp matches, "num", "string", "matches.to_s", "matches.captures"
	else
		tp matches, "num", "string", "matches.to_s"
	end
end

titles = [
	"RubyTapas007-Constructors",
	"059-enumerator",
	"status-150",
	"123",
	"555-86123432-Jok"
]

show_matches(titles, /\d{3}/)