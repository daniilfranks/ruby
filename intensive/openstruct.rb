require 'ostruct'

user = OpenStruct.new
p user.name = 'Den'
p user.age  = 25
p user.city = 'Kazan'

russia = OpenStruct.new(countru: 'Russia', population: 146_000_000)
p russia
p russia.population

role = OpenStruct.new(login: 'den', admin?: true)
p role.admin?
p role.send("admin?=",false)