require_relative 'constants'

class Transport
  attr_accessor :max_weight
  include Comparable
  include Constants

  @@all = []

  def initialize(max_weight, speed, available, location, number_of_deliveries, delivery_cost)
    @max_weight = max_weight
    @speed = speed
    @available = available
    @location = check_location(location)
    @number_of_deliveries = number_of_deliveries
    @delivery_cost = delivery_cost
    @@all << self
  end

  attr_reader :available, :speed

  def check_location(value)
    raise ArgumentError, "Current #{value} not included in locations" unless Constants::LOCATION.has_value?(value)
    value
  end

  def self.all
    @@all.select { |t| t.is_a? self }
  end

  def self.attributes
    %i[max_weight speed available number_of_deliveries delivery_cost location]
  end

  attributes.each do |attribute|
    define_singleton_method("find_by_#{attribute}") do |value|
      @@all.find do |transport|
        transport.public_send(attribute) == value
      end
    end
  end

  attributes.each do |attribute|
    define_singleton_method("filter_by_#{attribute}") do |&block|
      @@all.select do |transport|
        block.call(transport.public_send(attribute))
      end
    end
  end

  def max_weight_value
    max_weight if max_weight > 0
  end

  def delivery_time(distance)
    distance / speed.to_f
  end

  def <=>(other)
    (comparison_max_weight == other.comparison_max_weight) ? (comparison_max_distance <=> other.comparison_max_distance) : (comparison_max_weight <=> other.comparison_max_weight)
  end

  def comparison_max_weight
    @max_weight
  end

  def comparison_max_distance
    Float::INFINITY if Transport.respond_to?(max_distance)
  end

  def speed_by_weight
    @speed.to_f / @max_weight
  end

end










