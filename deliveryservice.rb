require_relative 'bike'
require_relative 'car'

class DeliveryService

  attr_reader :bikes_number, :cars_number

  def initialize(cars_number, bikes_number)
    @cars_number = Array.new(cars_number) { Car.new }
    @bikes_number = Array.new(bikes_number) { Bike.new }
  end

  def find_transport( package_weight, package_distance)
    if package_weight <= Constants::BIKE[:max_weight] && package_distance <= Constants::BIKE[:max_distance]
      available_bikes = []
      bikes_number.each do |a|
        if a.available
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
      cars_number.each do |a|
        if a.available == true
        available_cars.push(a)
        end
      end
      if available_cars.length > 0
      available_cars.first
      else
      end
    else
    end
  end

end






