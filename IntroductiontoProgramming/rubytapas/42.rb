require 'csv'

def memstats
	size = 'ps -o size= #{$$}'.strip.to_i
end

puts memstats
visitors = CSV.read('streaming.csv', headers: true)
visitors.each{ |v| p v }
visitors.each{ |v| p v['time'] }
visitors.count{ |v| p v['ip_address'] =~ /(\d+{3}).(\d+{3}).(\d+{3}).(\d+{3})/ }

count = 0
CSV.foreach('streaming.csv', headers: true) do |v|
	count += 1 if v['ip_address'] =~ /(\d+{3}).(\d+{3}).(\d+{3}).(\d+{3})/
end
p count