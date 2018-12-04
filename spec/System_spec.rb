require './lib/System'
require './lib/Fx'

describe 'System' do
  it "is only created with constants" do
    expect{ System.new }.to raise_error(ArgumentError)
  end

  context "when valid (defined constant values)" do
    before {
      @fx = Fx.new(-0.7879, # m0
                  -1.4357, # m1
                   1)      # Bp
      @sys_one = System.new(10000,          # n
                            0.9259,         # a
                            0.15,           # b1
                            1.5,            # b2
                            0.1,            # g
                            0.002,          # rl
                            @fx,
                            0.02,           # h
                            0.1,            # x0
                            0.1,            # y0
                            0.1)            # z0
    }

    it "has an Fx class" do
      expect(@sys_one.fx).to be_instance_of(Fx)
    end

    it "calculates x points" do
      expect(@sys_one.send(:calc_x, 2)).to be_within(0.001).of(0.11914)
    end

    it "calculates y points" do
      expect(@sys_one.send(:calc_y, 2)).to be_within(0.001).of(0.10133)
    end

    it "calculates z points" do
      expect(@sys_one.send(:calc_z, 2)).to be_within(0.001).of(0.07996)
    end
  end
end
