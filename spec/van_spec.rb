require 'van'

describe Van do
  let(:van) { described_class.new }
  let(:station) { double( :station )}
  let(:bike1) { double( :bike1, working?: true)}
  let(:bike2) { double( :bike2, working?: false)}
  let(:bike3) { double( :bike3, working?: false)}

  it 'takes broken bikes ' do
    allow(station).to receive(:bikes).and_return([bike1, bike2, bike3])
    van.take_from(station)
    expect(van.bikes).to eq [bike2, bike3]
  end

end