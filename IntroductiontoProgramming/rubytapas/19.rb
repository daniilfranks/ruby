SleepTimer = Struct.new(:minutes, :notifier, :notify_message) do 
	def start
		sleep minutes * 60
		notifier.public_send(notify_message, "Tea is ready!")
	end
end

timer = SleepTimer.new(0.01, $stdout, :puts)
timer.start



Product = Struct.new(:short_name, :long_name)

products = [
	Product.new("JonGldApl", "Jonagold apples from our own orchard"),
	Product.new("PchTrnvr", "Fresh-baked peach turnovers"),
	Product.new("TrkBrs", "Turkey bruschetta panini")
]

ProductListPresenter = Struct.new(:products, :show_message) do
	def render
		"".tap do |s|
			s << "<ul>class='product_list'>\n"
			products.each do |product|
				s << "<li>#{product.public_send(show_message)}</li>\n"
			end
			s << "</ul>"
		end
	end
end

puts ProductListPresenter.new(products, :short_name).render
p "="*30
puts ProductListPresenter.new(products, :long_name).render