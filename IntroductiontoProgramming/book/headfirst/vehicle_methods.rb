def start
	"Start!!!"
end

def use_head(brightness = "low")
	"#{brightness}"
end

def mileage(mile_drive, gas_used)
	if gas_used == 0
		return 0
	end
	mile_drive / gas_used
end

p start
p use_head
p use_head("go")
p mileage(400, 12)
p mileage(0, 0)