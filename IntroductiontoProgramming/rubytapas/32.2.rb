require 'open-uri'
require 'cgi'
require 'nokogiri'
temperature = Hash.new do |h, town|
	url = "http://www.google.com/ig/api?weather=" +
		CGI.escape(town)
	h[town] = open(url) do |body|
		Nokogiri::XML(body).
		at_css('current_conditions temp_f')['data']
	end
end

p temperature['Shrewsbury, PA']