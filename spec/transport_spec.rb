require 'rspec'
require_relative '../transport.rb'
require_relative '../car.rb'
require_relative '../bike.rb'


describe Transport do
  let(:transport) { described_class.new(10, 10, true) }
  let(:car) { Car.new }
  let(:bike) { Bike.new }

  it do
    expect(transport).to be_instance_of(Transport)
  end

  describe '#delivery_time' do
    context 'when by car' do
      let(:distance) { 100 }

      it do
        expect(car.delivery_time(distance)).to eq((distance / car.speed.to_f).round(2))
      end
    end

    context 'when by bike' do
      let(:distance) { 100 }

      it do
        expect(bike.delivery_time(distance)).to eq((distance / bike.speed.to_f).round(2))
      end
    end
  end
end

