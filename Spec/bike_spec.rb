require 'rspec'

require_relative '../bike.rb'

describe Bike do
  let(:bike) { described_class.new }
  let(:speed) {Constants::BIKE[:speed] }
  let(:max_weight) {Constants::BIKE[:max_weight] }
  let(:max_distance) {Constants::BIKE[:max_distance] }

  describe '#available' do
    it do
      expect(bike.available).to be_truthy
    end
  end

  describe '@speed' do
    it do
      expect(bike.speed).to eq(speed)
    end
  end

  describe '@max_weight' do
    it do
      expect(bike.max_weight).to eq(max_weight)
    end
  end

  describe '#delivery_time' do
    let(:distance) { 123 }
    let(:result) { (distance / bike.speed.to_f).round(2) }

    it do
      expect(bike.delivery_time(distance)).to be_kind_of(Float)
    end

    it do
      allow(bike).to receive(:delivery_time).with(distance).and_return(result)
      expect(bike.delivery_time(distance)).to eq(12.3)
    end
  end

  describe '#delivery_speed_by_weight' do
    let(:result) { (bike.speed.to_f / bike.max_weight).round(2) }

    it do
      expect(bike.speed_with_kg).to be_kind_of(Float)
    end

    it do
      allow(bike).to receive(:speed_with_kg).and_return(result)
      expect(bike.speed_with_kg).to eq(1)
    end
  end

end