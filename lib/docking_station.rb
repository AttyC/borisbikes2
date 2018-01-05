require_relative 'bike'
class DockingStation
  attr_reader :bikes
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "No bike available" if empty?
    raise "Do not release broken bike" if @bikes[0].broken?
    @bikes.pop
  end

  def dock_bike(bike)
    raise "Too many bikes" if @bikes.count == @capacity
    @bikes << bike
  end

  private

  def full?
    @bikes.count == @capacity ? true : false
  end

  def empty?
    @bikes.empty?
  end

end
