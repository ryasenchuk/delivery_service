class Transport
  attr_accessor :max_weight
  include Comparable
  def initialize(max_weight, speed, available)
    @max_weight = max_weight
    @speed = speed
    @available = available
  end

  attr_reader :available, :speed

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










