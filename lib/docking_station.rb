require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

def initialize
	@bikes = []
end
attr_reader :bikes

  def release_bike
  	fail 'No bikes available' if empty?
    @bikes.pop()
  end

  def dock(bike)
    fail 'Bike is already docked!' if full?
    @bikes.push(bike)
  end

  private

   def full?
      @bikes.count >= DEFAULT_CAPACITY
   end

   def empty?
   	   @bikes.count <= 0
   end

end
