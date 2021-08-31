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
    (comparison_max_w == other.comparison_max_w) ? (comparison_max_d <=> other.comparison_max_d) : (comparison_max_w <=> other.comparison_max_w)
  end

  def comparison_max_w
    @max_weight
  end

  def comparison_max_d
    @max_distance || Float::INFINITY
  end

end









