t = true
f = false
age = 21

#p t ? age < 18 : f

class BB
  def mu_method
    puts 'bb method'
  end
end

class OO
  def mu_method
    puts 'oo method'
  end
end

class CC
  def initialize(v = BB)
    @my_obj = v.new
  end

  def the_method
    @my_obj.mu_method
  end
end

bb = CC.new
puts bb.the_method

oo = CC.new(OO)
puts oo.the_method

#gem install ruby-progressbar
#require 'ruby-progressbar'

#progressbar = ProgressBar.create(:starting_at => 0, :total => 10)

#for i in (1..10)
# progressbar.increment
# sleep i
#end

#5.times do progressbar.increment; sleep 0.5 end

#progressbar = ProgressBar.create( :format         => "%a %b\u{15E7}%i %p%% %t",
#                    :progress_mark  => ' ',
#                    :remainder_mark => "\u{FF65}",
#                    :starting_at    => 1)

#puts 100.times { progressbar.increment; sleep 0.05 }

