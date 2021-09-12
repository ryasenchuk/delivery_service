require_relative 'bike'
require_relative 'car'
require_relative 'transport'

class DeliveryService < Transport

  attr_reader :transport_park

  def initialize
    @transport_park = []
    @transport_park += (new_car + new_bike)
  end

  def find_transport(package_weight, package_distance)
    package_weight <= Constants::BIKE[:max_weight] && package_distance <= Constants::BIKE[:max_distance] ?
      select_bike(package_weight) : select_transport(package_weight)
  end

  def select_transport(package_weight)
    available_transport = transport_park.select { |t| t.available }
    package_weight <= Constants::CAR[:max_weight] && available_transport.any? ? available_transport.first : nil
  end

  def select_bike(package_weight)
    available_bikes = transport_park.select { |t| t.instance_of? Bike and t.available }
    available_bikes.any? ? available_bikes.first : select_transport(package_weight)
  end

  private

  def new_car
    Array.new(Constants::CAR[:count]) {Car.new}
  end

  def new_bike
    Array.new(Constants::BIKE[:count]) {Bike.new}
  end

end

