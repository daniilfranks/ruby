(1..5).each do |i|
  puts i
end

(1..5).each { |i| puts i }


def foo
  yield
end

foo { puts 'Hi block' }


def log(str)
  puts "LOGGER: #{yield(str)}"
end

log("some data") do |str| 
  "My custom format of #{str}"
end


def log(str)
  return "Logger: #{yield(str)}" if block_given?

  "BASIC LOGGER: #{str}"
end

puts log('soma basic data')

result = log('soma data') do |str|
  "My custom format of #{str}"
end

puts result


class User
  attr_accessor :first_name, :last_name

  def initialize
    yield(self)
  end
end

user = User.new do |u|
  u.first_name = 'Den'
  u.last_name  = 'Bob'
end

puts "#{user.first_name} #{user.last_name}"


require 'ostruct'

class Logger
  attr_reader :config

  def initialize
    @config = OpenStruct.new

    config.prefix = "LOGGER"
    config.time_format = "%Y.%m.%d"

    yield(config) if block_given?
  end

  def log(str)
    "#{Time.now.strftime(config.time_format)} #{config.prefix}: #{str}"
  end
end

l = Logger.new
puts l.log("With standard config")

l = Logger.new do |config|
  config.time_format = "%Y-%d-%m"
  config.prefix      = "Custom"
end

puts l.log("Own logger")