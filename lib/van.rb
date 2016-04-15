
class Van
  DEFAULT_CAPACITY = 2

  attr_accessor :bikes, :capacity

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY - bikes.length
  end

  def take_from(station)
    @bikes += station.remove_broken_bikes
  end

end