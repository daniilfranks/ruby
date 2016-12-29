require 'thread'
require 'singleton'

def list

  ll = Dir.glob(['*.rb', '*.gz'])

  puts ll
end


class Nisse

  include Singleton

    attr_writer :freq

  def initialize
    puts 'Hej från Nisse', self.object_id
  end

  def run
    while true 
        puts 'Hej igen från Nisse',self.object_id
        sleep @freq 
      end
  end
end

class Janne

#  @@nisse ||= Nisse.instance

  @@nisse = Nisse.instance
  @@nisse.freq = 2
  def initialize
    trad = Thread.new { @@nisse.run }
    puts 'Hej från Janne'
    sleep 10
    Thread.kill(trad)
    puts trad.alive?
  end

end

#nn = [Janne.new, Janne.new]
#all  = nn.each do | x | Thread.new { x } end
#sleep 1

thr = Thread.new { puts "Whats the big deal" }
thr.join

arr = []
arr << Thread.new { puts 'Whats the big deal'}
arr << Thread.new { 3.times { puts 'Fun' } }
arr.each { |i| i.join }

require 'net/http'
pages = %w( www.rambler.com www.yandex.ru www.google.com )
threads = []
for page_to_fetch in pages
    threads << Thread.new(page_to_fetch) do |url|
        h = Net::HTTP.new(url, 80)
        puts "Fetching: #{url}"
        resp = h.get('/', nil )    
        puts "Got #{url}: #{resp.message}"
    end
end 
threads.each {|thr| thr.join }
