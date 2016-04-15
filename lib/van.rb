
class Van

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def take_from(station)
    @bikes += station.remove_broken_bikes
  end

end