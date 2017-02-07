array = [
	['Danila', 25, 'Kazan'],
	['Leon', 31, 'London'],
	['Oleg', 42, 'Kazan']]

def search_param(array, number_param, param_name)
	raise 'Parameter is not an array!!' if array.is_a?(Array) == false
	array.each { |i| p true if i[number_param].include?(param_name) == true }
end

search_param(array, 0, 'Danila')
