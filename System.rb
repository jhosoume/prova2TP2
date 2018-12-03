class System
  attr_reader :n, :a, :b1, :b2, :g, :rl, :m0, :m1, :bp, :h, :xn, :yn, :zn
  @@all = []

  def initialize(n, a, b1, b2, g, rl, m, bp, h, x0, y0, z0)
    self.n = n
    self.a = a
    self.b1 = b1
    self.b2 = b2
    self.g = g
    self.rl = rl
    self.m0 = m0
    self.m1 = m1
    self.bp = bp
    self.h = h
    
    self.xn = [x0]
    self.yn = [y0]
    self.zn = [z0]

    complete_calculation

    @@all << self
  end

  def self.all
    @@all
  end

  private
  def fx
  end

  def calc_x(indx)
  end

  def calc_y(indx)
  end

  def calc_z(indx)
  end

  def calc_H
  end

  def plot
  end

  def complete_calculation
  end
end

class DependentSystem < System
