require 'yaml'

p Psych.load('--- foo')

p Psych.dump('foo')

p hash = { name: 'Den', age: 25 }.to_yaml

begin
  p Psych.parse('--- `', 'file.txt')
rescue Psych::SyntaxError => ex
  p ex.file
  p ex.message
end

File.open('database.yml', 'w') do |file|
  p file.write(Psych.dump(['a', 'b']))
end

p Psych.parse_stream(File.read('database.yml'))

p Psych.parse_file('database.yml')

data = open('database.yml', 'r') { |f| Psych.load(f) }
p data