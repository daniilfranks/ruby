names = ['Bob','Den','James','John']
names.each {|name| puts name}

5.times {puts "Hi ruby"}

hash = {:name => 'Den', :age => 25, :city => 'Kazan'}
hash.each_key {|key| puts key}

File.open('blocks.txt', 'w') {|f| f.puts "Hi world"}