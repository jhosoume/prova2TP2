class Fx
  attr_accessor :m0, :m1, :bp
  attr_reader :m
  def initialize(m0, m1, bp)
    self.m0 = m0
    self.m1 = m1
    @m ||= m1 - m0
    self.bp = bp
  end

  def calculate(x_value)
     m0 * x_value + 0.5 * m * ((x_value + bp).abs - (x_value - bp).abs)
  end
end
