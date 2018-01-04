require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:dock_bike) }

  it 'bike can be docked' do
    expect(subject).to respond_to(:dock_bike).with(1).argument
  end

  it 'bike exists' do
    expect{subject.release_bike}.to raise_error("No bike available")
  end
  describe '#dock' do
    it 'raises an error when full' do
      subject.dock_bike(Bike.new)
      expect{subject.dock_bike(Bike.new)}.to raise_error("Too many bikes")
    end
  end
end
