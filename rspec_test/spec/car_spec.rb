require 'spec_helper'

describe 'Car' do

	describe 'attributes' do

		it 'read and write for :make' do
			car = Car.new
			car.make = 'Audi'
			expect(car.make).to eq('Audi')
		end

		it 'read and write for :year' do
			car = Car.new
			car.year = 2017
			expect(car.year).to eq(2017)
		end

		it 'read and write for :color' do
			#pending('Debugging a problem')
			car = Car.new
			car.color = 'red'
			expect(car.color).to eq('red')
		end

		it 'reading for :wheels' do
			car = Car.new
			expect(car.wheels).to eq(4)
		end

	end

	describe '.colors' do

		it 'return arrays colors name' do
			c = ['blue', 'black', 'red', 'green']
			expect(Car.colors).to match_array(c)
		end

	end

	describe '#full_name' do

		it 'return a sting in the expected format' do
			audi = Car.new(make: 'Audi', year: 2017, color: 'blue')
			expect(audi.full_name).to eq('2017 Audi blue')
		end

		context 'when initialize with no arguments' do
			it 'return a string default values' do
				car = Car.new
				expect(car.full_name).to eq('2017 Bmw black')
			end
		end

	end

end

	#describe '.colors' do
	#	it 'return arrays colors name'
	#		c = ['blue', 'black', 'red', 'green']
	#		expect(Car.colors).to match_array(c)
	#	end
	#end

	# expect().to()
	# expect().not_to()