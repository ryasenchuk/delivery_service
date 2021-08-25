require_relative 'transport'
require_relative 'constants'

class Bike < Transport

  attr_accessor :max_distance

  def initialize
    super( Constants::BIKE[:max_weight], Constants::BIKE[:speed], true )
    @max_distance = Constants::BIKE[:max_distance]
  end

end



