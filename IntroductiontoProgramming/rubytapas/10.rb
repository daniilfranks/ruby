require 'etc'

ENV.delete('Home')

p user = Etc.getlogin

p config_file = File.join(Dir.home(user), ".rubytapas")