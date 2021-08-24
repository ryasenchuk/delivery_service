class Transport

  def initialize(max_weight, speed, available)
    @max_weight = max_weight
    @speed = speed
    @available = available
  end

  attr_reader :available, :speed, :max_weight

  def max_weight_value
    max_weight if max_weight > 0
  end

  def delivery_time(distance)
    distance / speed.to_f
  end

  def <=>(other)
    speed_with_kg <=> other.speed_with_kg
  end

  def speed_with_kg
    @speed.to_f / @max_weight
  end

end









