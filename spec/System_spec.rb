require './lib/System'

describe 'System' do
  it "should be created with constants" do
    expect{ System.new }.to raise_error(ArgumentError)
  end

  context "when valid (defined constant values)" do
  end
end
