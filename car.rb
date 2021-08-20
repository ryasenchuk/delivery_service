require_relative 'transport'
require_relative 'constants'

class Car < Transport

  attr_accessor :registration_number

  def initialize
    super( Constants::CAR[:max_weight], Constants::CAR[:speed],true )
    @registration_number = rand(50)
  end


end


