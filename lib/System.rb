#require 'pry'

class System
  attr_reader :n, :a, :b1, :b2, :g, :rl, :fx, :h, :xn, :yn, :zn
  @@all = []

  def initialize(n, a, b1, b2, g, rl, fx, h, x0, y0, z0)
    @n = n
    @a = a
    @b1 = b1
    @b2 = b2
    @g = g
    @rl = rl
    @h = h

    @fx = fx # Class that calculates fx

    @xn = [x0]
    @yn = [y0]
    @zn = [z0]

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
