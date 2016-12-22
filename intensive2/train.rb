class Train
  @@trains_number = 0

  def initialize(name, type, wagoons)
    @name           = name
    @type           = type
    @wagoons        = wagoons
    @speed          = 0
    @route          = []
    @@trains_number += 1
  end

  def accelerate(speed)
    @speed += speed
    "#{@speed}"
  end

  def show_current_speed
    "#{@speed}"
  end

  def decelerate(speed)
    if @speed == 0
      "Train #{@name} stop."
    elsif @speed > speed
      "Stop on #{speed}"
    else
      @speed = 0
      'Train stop'
    end
  end

  def show_wagoons_number
    "#{@wagoons}"
  end

  def add_wagoon
    if @speed == 0
      @wagoons += 1
    else
      'Stop the train'
    end
  end

  def remove_wagoon
    if @speed == 0 && @wagoons > 0
      @wagoons -= 1
    else
      'Error'
    end
  end

  def accept_route(route)
    @route = route
    @initial_station = route.first
  end

  def move_to(station)
    if @route.include?(station)
      @station = station
      "#{station}"
    else
      'No station'
    end
  end

  def show_position
    "Train number #{@number} on station #{@station}"
  end

  def train_details
    return { type: @type, wagoons: @wagoons}
  end
end

class Route
  def initialize(stations = [])
    if stations.size >= 2
      @stations = stations
      @@routes_number += 1
      @number = @@routes_number
      "New route created #{@number} #{@number} #{stations.first} - #{stations.last}"
    else
      'Min route 2 stations'
    end
  end

  def add_station(station)
    @stations.insert(-2, station)
    "New station #{station}"
  end

  def del_station(station)
    if @stations.include?(station)
      @stations.delete(station)
      'Station delete'
    else
      'Error, no station'
    end
  end

  def stations_list
    "Route #{@number} #{stations.first} - #{stations.last}"
    @stations.each_with_index{ |station, index| puts "#{index + 1}. #{station}" }
  end
  
  def stations
    @stations
  end
end  

class RailwayStation
  @@number_of_station = 0

  def initialize(name)
    @name               = name
    @trains             = []
    @@number_of_station += 1
  end

  def accept_train(params = {})
    if params[:type].nil? || params[:wagoons].nil?
      'No train'
    else
      @trains << {type: params[:type], wagoons: params[:wagoons]}
      "Train: #{params[:type]}, #{params[:wagoons]} station: #{@name}"
      "Trains station: #{@trains.size}"
    end
  end

  def show_all_trains
    "#{@trains.size} #{@name}"
    @trains.each_with_index { |train, index| puts "#{index + 1}. #{train[:type]}, #{train[:wagoons]}"}
  end

  def show_types_of_trains
    "#{@trains.size} #{@name}"
    "freight train: #{(@trains.select { |train| train[:type] == 'freight'}).size}"
    "passenger train: #{(@trains.select { |train| train[:type] == 'passenger'}).size}"
  end

  def run_train(params = {})
    if @trains.include?({ type: params[:type], wagoons: params[:wagoons] })
      @trains.delete({ type: params[:type], wagoons: params[:wagoons] })
      "Train leave: type#{params[:type]}, #{params[:wagoons]} station: #{@name}"
      "Train station: #{@trains.size}"
    else
      "#{@station} no train!"
    end
  end
end

p train1 = Train.new('Red wings', 'passenger', 10)
p train2 = Train.new('Palmira', 'passenger', 20)
p train3 = Train.new('VTB', 'freight', 70)

p station1 = RailwayStation.new('Moscow')
p station2 = RailwayStation.new('Kazan')
p station3 = RailwayStation.new('Zelenodolsk')
p station4 = RailwayStation.new('Penza')