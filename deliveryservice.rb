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
      available_bikes = bikes_number.select { |a| a.available == true }
      available_bikes.any? ? available_bikes.first : verification_cars(package_weight)
    else
      verification_cars(package_weight)
    end
  end

  def verification_cars(package_weight)
    available_cars = cars_number.select { |a| a.available == true }
    package_weight <= Constants::CAR[:max_weight] && available_cars.any? ? available_cars.first : nil
  end

end

# p d = DeliveryService.new(1,2)
#
# p d.find_transport(7,8)
#
# p Car.new <=> (Bike.new)

p c = Car.new

p c.speed_with_kg








