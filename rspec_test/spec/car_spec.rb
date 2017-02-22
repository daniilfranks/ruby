require 'spec_helper'

describe 'Car' do

	describe 'attributes' do

		let(:car) { Car.new }

		#before(:example) do
		#	@car = Car.new
		#end

		it 'read and write for :make' do
			car.make = 'Audi'
			expect(car.make).to eq('Audi')
		end

		it 'read and write for :year' do
			car.year = 2017
			expect(car.year).to eq(2017)
		end

		it 'read and write for :color' do
			#pending('Debugging a problem')
			car.color = 'red'
			expect(car.color).to eq('red')
		end

		it 'reading for :wheels' do
			expect(car.wheels).to eq(4)
		end

	end

	describe '.colors' do

		let(:colors) { ['blue', 'black', 'red', 'green'] }

		it 'return arrays colors name' do
			expect(Car.colors).to match_array(colors)
		end

	end

	describe '#full_name' do

		let(:audi) { Car.new(make: 'Audi', year: 2017, color: 'blue') }
		let(:new_car) { Car.new }

		it 'return a sting in the expected format' do
			expect(audi.full_name).to eq('2017 Audi blue')
		end

		context 'when initialize with no arguments' do
			it 'return a string default values' do
				expect(new_car.full_name).to eq('2017 Bmw black')
			end
		end

	end

end

# expect('Den').to('Den')
# expect('Den').not_to('Leo')

# expect('Danila').to match(/D.n.a/)
# expect(true).to be(true)
# expect([cat,dog]).to match_array([cat,dog])

# expect(1).to eq(1)
# expect(1).to be == 1
# expect(1).to equal(1)
