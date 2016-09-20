class HiWorld
	def hi_ruby
		puts "Hi ruby!"
	end

	def hi_name(name)
		"#{name}"
	end

	def test
		puts "TEST"
	end
end

class Hi < HiWorld
	def hi_ruby
		super
		puts "Hi php"
	end

	def hi_name(name)
		myname = super(name)
		"Hi mr #{myname}"
	end
end

hi = HiWorld.new
hi.hi_ruby

Hi.new.hi_ruby

hiphp = Hi.new
hiphp.hi_ruby

p Hi.new.hi_name("Jok")

Hi.new.test