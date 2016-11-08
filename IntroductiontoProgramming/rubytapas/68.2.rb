require 'csv'

PersonalAccount = Struct.new(
	:first_name,
	:last_name,
	:email) do 

	def display(r)
		r.name("#{first_name} #{last_name}")
		r.email(email)
	end
end

CorporateAccount = Struct.new(
	:company_name,
	:email,
	:tax_id) do 

	def display(r)
		r.name(company_name)
		r.email(email)
		r.tax_id(tax_id)
	end
end

TrialAccount = Struct.new(:email) do 

	def display(r)
		r.name("Trial Account User")
		r.email(email)
	end
end

class CsvRenderer
	def initialize(destination)
		@csv = CSV.new(destination)
	end

	def method_missing(name, value=nil)
		@csv << [name, value]
	end
end

class HtmlAccountRenderer
	def method_missing(name, value=nil)
		instance_variable_set("@#{name}", value)
	end

	def render
		<<"END"
<div class="account vcard">
	<p>
		Account details for:
		<span class="email">#{@email}</span>
	</p>
	<p class="fn">#{@name}</p>
</div>
END
	end
end

class SummaryAccountRenderer
	def method_missing(name, value=nil)
		#NOOP
	end

	def name(name)
		@name = name
	end

	def email(email)
		@email = email
	end

	def render
		"#{@name} <#{@email}>"
	end
end

pa = PersonalAccount.new('Tom', "Servo", "tom@example.com")
ca = CorporateAccount.new('Den', "den@example.org")
ta = TrialAccount.new("test@example.de")

renderer = HtmlAccountRenderer.new
pa.display(renderer)
puts renderer.render

p "=" * 30

renderer = SummaryAccountRenderer.new
pa.display(renderer)
puts renderer.render