require 'docking_station'

describe DockingStation do
let(:station) { described_class.new }
let(:bike) { double(:bike) } # dependency
let(:bikes) { subject.bikes } # OK!
let(:bike1) { double( :bike1, working?: true)}
let(:bike2) { double( :bike2, working?: false)}
let(:bike3) { double( :bike3, working?: false)}
let(:broken_bikes) { [bike2,bike3] }

  it 'has a DEFAULT_CAPACITY unless capacity is specified' do    #ok
    expect subject.capacity == DockingStation::DEFAULT_CAPACITY  #ok
  end


#  describe 'initialization' do
 # it 'has a variable capacity' do
  #  docking_station = DockingStation.new(50)
#    50.times { docking_station.dock Bike.new }
 #   expect{ docking_station.dock Bike.new }.to raise_error 'Docking station full'
  #end
#end

describe 'initialization' do


  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike) # dependency
    end
    expect{ subject.dock(bike) }.to raise_error 'Docking station full' # depend
  end
end

  it { is_expected.to respond_to :release_bike } # ok

   describe '#release_bike' do
     it 'raises an error if there is no bike' do
      (expect { subject.release_bike }.to raise_error 'No bikes available') if subject.bikes.length == 0
      end # all ok!

     it 'raises an error if bike isn\'t working' do
     allow(bike).to receive(:working?).and_return(false)
     subject.dock(bike)  # depend
     (expect { subject.release_bike }.to raise_exception 'Bike not working') #unless bikes.last.working?
     end   # sort of possible dependency or something
  end




    it 'releases a bike' do
      subject.dock(bike)   # depend
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.release_bike).to eq bike # depend
    end

     it 'releases a working bike' do

       subject.dock(bike)
       allow(bike).to receive(:working?).and_return(true)
             # bike = subject.release_bike
    #   expect(bike).to be_working
       expect(subject.release_bike).to be_working # maybe depend probably faily
      end


  it { is_expected.to respond_to(:dock).with(1).argument }  #ok

  describe '#dock' do
    it 'raises an error if there is already a bike docked' do
     # bike = Bike.new
      #bike2 = Bike.new
      #subject.dock(bike)
      #expect { subject.dock(bike2) }.to raise_error 'Bike already docked!'
      subject.capacity.times { subject.dock bike }   # depend
      expect { subject.dock bike }.to raise_error 'Docking station full'  #depend
    end
  end



  it 'docks bike' do
    expect(subject.dock(bike)).to eq bike  #depend
  end

  it 'returns docked bike' do
    subject.dock(bike)      #depend
    expect(subject.bikes.last).to eq bike # depend
  end

  it { is_expected.to respond_to(:bikes) } # ok

  it 'removes all broken bikes' do
    subject.dock(bike1)
    subject.dock(bike2)
    subject.dock(bike3)
    expect(subject.remove_broken_bikes).to eq broken_bikes
    expect(bikes).to eq [bike1]
  end

end
