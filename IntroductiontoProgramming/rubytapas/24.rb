require 'ostruct'

user = OpenStruct.new(:qualifiles_for_free_sandwich? => true)

def receipt_message(user)
	message = if user.qualifiles_for_free_sandwich?
		"Congratulations, you qualify for a free sandwich!"
		else
			"Come again soon!"
		end
		if rand(10) == 0
			message << "\nBring this receipt back for a 10% discount!"
		end
		message
end

puts receipt_message(user)


def slugify(title)
	title.tr_s('^A-Za-z0-9', '-').downcase
end

p slugify "'Twas brilling, and the slithy toves..."