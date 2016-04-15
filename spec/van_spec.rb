require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:station) { double( :station )}
  let(:bike1) { double( :bike1, working?: true)}
  let(:bike2) { double( :bike2, working?: false)}
  let(:bike3) { double( :bike3, working?: false)}

  it 'takes broken bikes ' do
    allow(station).to receive(:remove_broken_bikes).and_return([bike2, bike3])
    van.take_from(station)
    expect(van.bikes).to eq [bike2, bike3]
  end

  it 'new van should have a capacity of 2' do
    expect(van.capacity).to eq Van::DEFAULT_CAPACITY
  end

=begin
  context 'when van is full' do
    it 'should pass the current capacity to the docking station' do
      docking_station = spy(:docking_station)
      van.take_from(docking_station)
      expect(docking_station).to have_received(:remove_broken_bikes).with(2)
    end
  end
=end

end