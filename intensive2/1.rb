require 'thread'

array = []

seo = Thread.new do
  20.times do |i|
    sleep rand(i)
    puts "#{i}: Seo"
    array << "#{i}: Seo, #{Time.new}"
  end
end

programmer = Thread.new do
  20.times do |i|
    sleep rand(i/2)
    puts "#{i}: Programmer"
    array << "#{i}: AProgrammer, #{Time.new} "
  end
end

manager = Thread.new do
  20.times do |i|
    sleep rand(i)
    puts "#{i}: Manager"
    array << "#{i}: Manager, #{Time.new}"
  end
end

hr = Thread.new do
  20.times do |i|
    sleep rand(i/2)
    puts "#{i}: Hr"
    array << "#{i}: Hr, #{Time.new} "
  end
end

hr.join
p array