require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike) }

  it 'bike exists' do
    expect{subject.release_bike}.to raise_error("No bike available")
  end

  describe '#dock' do
    it 'bike can be docked' do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end
    it 'uses default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'raises an error when full' do
      subject.capacity.times{subject.dock_bike(Bike.new)}
      expect{subject.dock_bike(Bike.new)}.to raise_error("Too many bikes")
    end

    it 'report bike is broken?' do
      bike1 = Bike.new
      expect{subject.dock_bike(bike1.report_broken)}.to raise_error("Bike is broken")
    end

    it 'do not release broken bike' do
      bike2 = Bike.new
      bike2.broken?
      subject.dock_bike(bike2) # this has been set to true
      expect{subject.release_bike}.to raise_error("Do not release broken bike")
    end
  end
end
