require_relative '4.rb'

den = User.new('Den', 25, 'Kazan', 'user.txt')
den.write_file
den.read_file
