def names
	yield "Jok"
	yield "Den"
	yield "Zik"
	yield "Io"
end

enum = to_enum(:names)
p enum.next

enum.with_index.each do |name, i|
	puts "#{i} #{name}"
end

class MyEnumerator
	def initialize(object, method_name, *args)
		@fider = Fiber.new do
			object.send(method_name, *args) do |*yielded_values|
				Fiber.yield(*yielded_values)
			end
		end
	end

	def next
		@fiber.resume
	end
end

enum = MyEnumerator.new(self, :name)
p enum.next