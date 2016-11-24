#Рассчитывает набор однозначных сокращений для данного набора строк.
require 'abbrev'

puts Abbrev.abbrev(['ruby'])

php = %w{ php }.abbrev
puts php["p"]
puts php

car = %w{ car bmw }.abbrev(/bm/)
puts car