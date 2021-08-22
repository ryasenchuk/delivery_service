require_relative 'bike'
require_relative 'car'

class DeliveryService

  attr_reader :bikes, :cars

  def initialize(cars, bikes)
    @cars = Array.new(cars) { Car.new }
    @bikes = Array.new(bikes) {Bike.new}
  end

  def find_transport( package_weight, package_distance)
    if package_weight <= Constants::BIKE[:max_weight] && package_distance <= Constants::BIKE[:max_distance]
      available_bikes = []
      bikes.each do |a|
        if a.available == true
          available_bikes.push(a)
        end
      end
      if available_bikes.length > 0
        available_bikes.first
      else
        verification_cars(package_weight)
      end
    else verification_cars(package_weight)
    end
  end

  def verification_cars(package_weight)
    if package_weight <= Constants::CAR[:max_weight]
      available_cars = []
      cars.each do |a|
        if a.available == true
        available_cars.push(a)
        end
      end
      if available_cars.length > 0
      available_cars.first
      else
      'Available transport not found'
      end
    else
      'Available transport not found'
    end
  end

end



