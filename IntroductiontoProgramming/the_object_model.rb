p "hello".class

module Speak
	def speak sound
		puts sound
	end
end

class First
	include Speak
end

class Two
	include Speak
end

carl = First.new
carl.speak("Hi")

den = Two.new
den.speak("play radio")