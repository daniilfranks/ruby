=begin 
Идет k-я секунда года. Необходимо определить 
сколько полных месяцев и полных недель осталось до конца года.
=end

tn = Time.new
p 12 - tn.month
p Time.new(tn.year, 12, 31).strftime("%W").to_i - tn.strftime("%W").to_i