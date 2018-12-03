require './lib/System'
require './lib/Fx'

describe 'Fx' do
  it "has m0, m1 and bp" do
    expect{ Fx.new }.to raise_error(ArgumentError)
  end

  context "when valid" do
    before {
      @fx =  Fx.new(-0.7879, # m0
                   -1.4357, # m1
                   1)       # Bp
    }

    it "has a m0 number" do
      expect(@fx.m0).to be(-0.7879)
    end

    it "has a m1 number" do
      expect(@fx.m1).to be(-1.4357)
    end

    it "has a bp number" do
      expect(@fx.bp).to be(1)
    end

    it "has a m number" do
      expect(@fx.m).to be_within(0.001).of(-0.6478)
    end

    it "is calculate when receives a xn value" do
      result = @fx.calculate(0)
      expect(result).to be_within(0.001).of(0)

      result = @fx.calculate(0.02)
      expect(result).to be_within(0.001).of(-0.028714)

      result = @fx.calculate(-1)
      expect(result).to be_within(0.001).of(1.4357)
    end
  end
end

describe 'System' do
  it "is only created with constants" do
    expect{ System.new }.to raise_error(ArgumentError)
  end

  context "when valid (defined constant values)" do
  end
end
