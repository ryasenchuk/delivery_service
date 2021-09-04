require 'rspec'

require_relative '../delivery_service.rb'

describe DeliveryService do
  let(:delivery_service) { described_class.new }
  describe '.new' do
    it do
      expect(delivery_service).to be_instance_of(DeliveryService)
    end
  end

  describe '@cars' do
    it 'returns the array of Car objects' do
      expect(delivery_service.transport_park).to be_kind_of(Array)
    end
  end

  describe '@bikes' do
    it 'returns the array of Bike objects' do
      expect(delivery_service.transport_park).to be_kind_of(Array)
    end
  end


end