require 'rspec'

require_relative '../delivery_service.rb'

describe DeliveryService do
  let!(:delivery_service) { described_class.new }

  context "#find_transport" do
    context "when weight and distance correct for bike" do
      it "return Bike" do
        expect(delivery_service.find_transport(10,10)).to be_an_instance_of Bike
      end
    end

    context "when weight and distance correct for car" do
      it "return Car" do
        expect(delivery_service.find_transport(40,10)).to be_an_instance_of Car
      end
    end

    context "when weight and distance incorrect for bike and car" do
      it "nil" do
        expect(delivery_service.find_transport(120,10)).to eql nil
      end
    end
  end

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