require 'bike'

describe Bike do
  it {is_expected.to respond_to(:working?)}

  it {is_expected.to respond_to(:broken?)}

  it 'is can be reported broken' do
    expect(subject).to be_broken
  end
  it 'is working' do
    expect(subject).to be_working
  end

end
