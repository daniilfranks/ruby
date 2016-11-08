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

	def to_summary
		"#{first_name} #{last_name} <#{email}>"
	end

	def to_html
		<<"END"
<div class="account vcard">
	<p>
		Account details for:
		<span class="email">#{email}</span>
	</p>
	<p class="fn">#{first_name} #{last_name}</p>
</div>
END
	end
end

CorporateAccount = Struct.new(
	:company_name,
	:email,
	:tax_id)

p TrialAccount = Struct.new(:email)