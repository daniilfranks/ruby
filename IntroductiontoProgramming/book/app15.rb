#gem install mechanize
require 'mechanize'
require 'csv'

search_terms = ['Bill Gates', 'Steve Jobs', 'Sergey Brin']

agent = Mechanize.new { |agent| 
	agent.user_agent_alias = 'Mac Safari'
}

page = agent.get('https://www.wikipedia.org')
search_form = page.form(action: '//www.wikipedia.org/search-redirect.php')

search_terms.each do |term|
	search_form.search = term
	results = agent.submit(search_form, search_form.button('go'))
	html_results = Nokogiri::HTML(results.body)

	name = html_results.at_css('#firstHeading').content

	unless html_results.at_css('.bday').nil?
		bday = html_results.at_css('.bday').content
	else
		bday = ""
	end

	unless dday = html_results.at_css('.dday').nil?
		dday = html_results.at_css('.dday').content
	else
		dday = ""
	end

	CSV.open('life-data.csv', 'a+') do |csv|
		csv << [name, bday, dday]
	end

	puts "#{name} #{bday} #{dday}"
end