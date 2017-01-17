require 'rubygems'
require 'json-schema'

first = { 'users' => { 1 => { name: 'Den',  age: 25 }, 
											 2 => { name: 'Leon', age: 30 }
											},
					'log' => 'Error',
					'array' => ['Error'],
					"properties" => {
    												"a" => {"type" => "integer"}
  												}
				}

second = { 'a' => 'string' }

p first

begin
  JSON::Validator.validate!(first, second)
  p 'Valid!!!'
rescue JSON::Schema::ValidationError => e
  p e.message
end
