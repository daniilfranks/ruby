=begin
Следующий паттерн проектирования, который мы рассмотрим — Singleton. 
Он относится к порождающим паттернам. Многие программисты знакомы только 
с этим шаблоном проектирования, и большинство из них утверждают, что 
Singleton это зло. Но Singleton используется повсеместно. 
Что касается Ruby, можно увидеть использование этого паттерна 
в Webrick, rack, Rails, и это только несколько примеров. 
Так что же делает этот паттерн таким незаменимым?

Да все очень просто. Паттерн простой и очень удобный. 
Существует множество ситуаций, когда некий ресурс или объект должен 
быть уникальным. Например, конфигурация приложения, логгер, 
главное окно приложения, база данных и т. д.
=end

require 'singleton'

class Logger
  include Singleton

  attr_accessor :level

  ERROR   = 1
  WARNING = 3
  INFO    = 3

  def initialize
    @log   = File.open('log.txt', 'w')
    @level = WARNING
  end

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.puts(msg) if @level >= INFO
    @log.flush
  end
end

logger = Logger.instance
logger.info('Info message')
logger.warning('Warning message')
logger.error('Error message')

logger2 = Logger.instance

puts logger === logger2
puts logger.object_id == logger2.object_id