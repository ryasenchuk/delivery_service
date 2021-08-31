require 'rspec'

require_relative '../deliveryservice.rb'

describe DeliveryService do
  let(:delivery_service) { described_class.new }
  describe '.new' do
    it do
      expect(delivery_service).to be_instance_of(DeliveryService)
    end
  end

  describe '@cars' do
    it 'returns the array of Car objects' do
      expect(delivery_service.cars_number).to be_kind_of(Array)
    end
  end

  describe '@bikes' do
    it 'returns the array of Bike objects' do
      expect(delivery_service.bikes_number).to be_kind_of(Array)
    end
  end

  
end