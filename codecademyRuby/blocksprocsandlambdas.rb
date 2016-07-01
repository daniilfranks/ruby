5.times do
    puts "I'm a block!"
end

fibs = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
doubled_fibs = fibs.collect {|num| num * 2}

def block_test
  puts "We're in the method!"
  puts "Yielding to the block..."
  yield
  puts "We're back in the method!"
end

block_test { puts ">>> We're in the block!" }

def yield_name(name)
  puts "In the method! Let's yield."
  yield name
  puts "Block complete! Back in the method."
end

yield_name("Eric") { |name| puts "My name is #{name}." }
yield_name("Bugra") { |name| puts "My name is #{name}." }


def double(b)
    yield b
end
p double(2) {|a| a * 2 }


multiples_of_3 = Proc.new do |n|
  n % 3 == 0
end
(1..100).to_a.select(&multiples_of_3)


floats = [1.2, 3.45, 0.91, 7.727, 11.42, 482.911]
round_down = Proc.new {|a| a.floor}
ints = floats.collect(&round_down)


over_4_feet = Proc.new do |height| height >= 4
end  

group_1 = [4.1, 5.5, 3.2, 3.3, 6.1, 3.9, 4.7]
group_2 = [7.0, 3.8, 6.2, 6.1, 4.4, 4.9, 3.0]
group_3 = [5.5, 5.1, 3.9, 4.3, 4.9, 3.2, 3.2]

can_ride_1 = group_1.select(&over_4_feet)
can_ride_2 = group_2.select(&over_4_feet)
can_ride_3 = group_3.select(&over_4_feet)


def greeter
yield
end

phrase = Proc.new {puts "Hello there!"}
greeter(&phrase)


hi= Proc.new do
    puts "Hello!"
end
hi.call

numbers_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
strings_array = numbers_array.map(&:to_s)


def lambda_demo(a_lambda)
  puts "I'm the method!"
  a_lambda.call
end

lambda_demo(lambda { puts "I'm the lambda!" })


strings = ["leonardo", "donatello", "raphael", "michaelangelo"]
symbolize = lambda { |x| x.to_sym }
symbols = strings.collect(&symbolize)



def batman_ironman_proc
  victor = Proc.new { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_proc

def batman_ironman_lambda
  victor = lambda { return "Batman will win!" }
  victor.call
  "Iron Man will win!"
end

puts batman_ironman_lambda


my_array = ["raindrops", :kettles, "whiskers", :mittens, :packages]
symbol_filter = lambda {|x| x.is_a? Symbol }
symbols = my_array.select(&symbol_filter)


odds_n_ends = [:weezard, 42, "Trady Blix", 3, true, 19, 12.345]
process = lambda {|x| x.is_a? Integer}
ints = odds_n_ends.select(&process)


ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]
under_100 = Proc.new {|a| a < 100}



ages = [23, 101, 7, 104, 11, 94, 100, 121, 101, 70, 44]

under_100 = Proc.new {|a| a < 100}
youngsters = ages.select(&under_100)


crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}

first_half = lambda {|a, b| b < "M" }



crew = {
  captain: "Picard",
  first_officer: "Riker",
  lt_cdr: "Data",
  lt: "Worf",
  ensign: "Ro",
  counselor: "Troi",
  chief_engineer: "LaForge",
  doctor: "Crusher"
}

first_half = lambda {|a, b| b < "M" }
a_to_m = crew.select(&first_half)