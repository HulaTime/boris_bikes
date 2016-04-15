require_relative "bike"

class DockingStation
  DEFAULT_CAPACITY = 20


  attr_accessor :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    raise 'Docking station full' if full?
    bikes << bike
    bikes.last
  end

  def release_bike
    raise 'No bikes available' if empty?
    raise 'Bike not working' unless bikes.last.working?
    bikes.pop
  end

  def remove_broken_bikes
    delivery = @bikes.select {|b| !b.working?}
    @bikes -= delivery
    delivery
  end


  private
  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end