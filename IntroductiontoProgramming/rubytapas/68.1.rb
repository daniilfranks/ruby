PersonalAccount = Struct.new(
	:first_name,
	:last_name,
	:email) do 

	def to_csv
		CSV.generate { |csv|
			[:first_name, :last_name, :email].each do |name|
				csv << [name, self[name]]
			end
		}
	end
end

class HtmlPersonalAccountView
	TEMPLATE = ERB.new(<<END)
<div class="account vcard">
	<p>
		Account details for:
		<span class="email"><%= email %></span>
	</p>
	<p class="fn"><%= first_name %><%= last_name %></p>
</div>
END

	def render(account)
		account.incstance_eval do 
			TEMPLATE.run(binding)
		end
	end
end

