require 'open-uri'
require 'nokogiri'

url = 'http://export.yandex.ru/bar/reginfo.xml?region=11119.xml'
xml = Nokogiri::XML(open(url))

f = File.new('kazan.xml','w+')
f.write(xml)
f.close

puts xml.at_css('weather title').content
puts xml.at_css('weather date').content.scan(/\d+/).join(".")
puts xml.at_css('weather night_short').content