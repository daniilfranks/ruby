module Eventful
	def self.included(other)
		other.extend(Macros)
	end

	def add_listener(listener)
		(@listener ||= []) << listener
	end

	def notify_listeners(event, *args)
		(@listener || []).each do |listener|
			listener.public_send("on_#{event}", *args)
		end
	end

	module Macros
		def event(name)
			mod = if const_defined?(:Events, false)
							const_get(:Events)
						else
							new_mod = Module.new do 
								def self.to_s
									"Events(#{instance_methods(false).join(', ')})"
								end
						  end
						  const_set(:Event, new_mod)
						end
			mod.module_eval(%Q{
				def #{name}(*args)
					notify_listeners(:#{name}, *args)
				end

				def self.to_s
					'Event(#{name})'
				end
			})
			include mod
		end
	end
end

class Dradis
	include Eventful

	event :new_contact
	event :radiation_warning
	event :tigh_is_drunk_again

	attr_reader :contact_count

	def initialize
		@contact_count = 0
	end

	def new_contact(*)
		@contact_count += 1
		super
	end
end

class ConsoleListener
	def on_new_contact(direction, range)
		puts "DRADIS contact! #{range} kilometers, bearing #{direction}"
	end
end

p Dradis.ancestors

Dradis::Event.instance_methods(false).each do |event_trigger|
	puts event_trigger
end