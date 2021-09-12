require_relative 'transport'
require_relative 'constants'

class Car < Transport

  attr_accessor :registration_number

  def initialize
    super( Constants::CAR[:max_weight], Constants::CAR[:speed],true,Constants::CAR[:LOCATION],rand(100), 20 )
    @registration_number = rand(5000)
  end

end


