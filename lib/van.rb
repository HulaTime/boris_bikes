
class Van

  attr_accessor :bikes

  def initialize
    @bikes = []
  end

  def take_from(station)
    @bikes += station.bikes.select { |b| !b.working? }
  end

end