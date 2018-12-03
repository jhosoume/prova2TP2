#require 'pry'

class System
  attr_accessor :n, :a, :b1, :b2, :g, :rl, :m0, :m1, :bp, :h, :xn, :yn, :zn
  @@all = []

  def initialize(n, a, b1, b2, g, rl, fx, h, x0, y0, z0)
    self.n = n
    self.a = a
    self.b1 = b1
    self.b2 = b2
    self.g = g
    self.rl = rl
    self.h = h

    self.fx = fx # Class that calculates fx

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
  def first_x
  end

  def first_y
  end

  def first_z
  end

  def calc_x(indx)
  end

  def calc_y(indx)
  end

  def calc_z(indx)
  end

  def complete_calculation
  end

  def calc_H
  end

  def plot
  end

end

class DependentSystem < System
end

#binding.pry
