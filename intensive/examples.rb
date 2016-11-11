arr = [{a: 1, b: 1, c: nil}, {a: 1, b: 2, c: 0}, {a: 2, b: 3, c: 4}]
p arr.delete_if { |x| x[:a] == 1 }

#валидный JSON
def valid_json?(json)
  begin
    JSON.parse(json)
    return true
  rescue JSON::ParserError => e
    return false
  end
end

require 'json'
require 'net/http'
require 'uri'

def open(url)
  Net::HTTP.get(URI.parse(url))
end

json = open('https://geocode-maps.yandex.ru/1.x/?format=json&geocode=%D0%A2%D0%B2%D0%B5%D1%80%D1%81')
data = JSON.parse(json)
puts data['response']['GeoObjectCollection']['featureMember'][0]['GeoObject']['metaDataProperty']['GeocoderMetaData']['text']


url = 'https://geocode-maps.yandex.ru/1.x/?format=json&geocode=Тверс'
uri = URI(URI.encode(url))
response = Net::HTTP.get(uri)
response_json = JSON.parse(response)


list = [{name: 'one', type: 'number'}, {name: 'one', type: 'string'}, {name: 'two', type: 'number'}]
p list.uniq {|i| i[:name] }

#then необходим, если хотите использовать if в одну строчку
val = 5
puts (val == 1 ? '1' : 'Not 1')
puts (if val == 1 then '1' else 'Not 1' end)
#Также используется в case


require 'date'
start = Date.parse('2012-09-02')
finish = Date.parse('2013-11-30')
dates_array = (start..finish).map(&:to_s)
p dates_array = (start..finish).map {|d| "#{d.month}.#{d.year}" }.uniq

old_date = Date.strptime('04.08.2015', '%d.%m.%Y')
today_date = Date.strptime('07.09.2015', '%d.%m.%Y')
p (today_date - old_date).to_i * 24

today_date = '07.09.2015'
old_date = '04.08.2015'
p (Date.parse(today_date) - Date.parse(old_date)).to_i*24