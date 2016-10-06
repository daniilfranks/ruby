#gem install nokogiri
require 'open-uri'
require 'nokogiri'

url = 'https://ssearch.oreilly.com/?q=ruby&x=0&y=0'
doc = Nokogiri::HTML(open(url))

books = doc.css('div.result.product-result')

x = 0
books.each do |b|
	id = x += 1
	puts "========ID: #{id}"
	puts b.at_css('p.title').content.scan(/\w+/).join(" ")
	puts b.at_css('p.note').content.scan(/\w+/).join(" ")
	puts b.at_css('p.note.publisher').content.scan(/\w+/).join(" ")
	puts b.at_css('p.note.date2').content.scan(/\w+/).join(" ")
	puts ""
end