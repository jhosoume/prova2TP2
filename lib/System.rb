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
    b1_inverted = b1 ** -1
    xn[1] = xn[0] + h * (a * (yn[0] - xn[0]) * 
                  b1_inverted - fx.calculate(xn[0]) * b1_inverted) 
  end

  def first_y
    b2_inverted = b2 ** -1
    yn[1] = yn[0] + h * (a * (yn[0] - xn[0]) *
                  b2_inverted + zn[0] * b2_inverted)  
  end

  def first_z
    g_inverted = g ** -1
    zn[1] = zn[0] + h *
      ((yn[0] - rl * zn[0]) * g_inverted) 
  end

  def calc_x(indx)
    b1_inverted = b1 ** -1
    prev_indx = indx - 2
    xn[indx] = xn[prev_indx] + h * (a * (yn[prev_indx] - xn[prev_indx]) * 
                  b1_inverted - fx.calculate(xn[prev_indx]) * b1_inverted)
  end

  def calc_y(indx)
    b2_inverted = b2 ** -1
    prev_indx = indx - 2
    yn[indx] = yn[prev_indx] + h * (a * (xn[prev_indx] - yn[prev_indx] ) *
                  b2_inverted + zn[prev_indx] * b2_inverted)  
  end

  def calc_z(indx)
    g_inverted = g ** -1
    prev_indx = indx - 2
    zn[indx] = zn[prev_indx] - h * 
      (yn[prev_indx] + rl * zn[prev_indx]) * g_inverted 
  end

  def complete_calculation
      for indx in 3..n
        calc_x(indx)
        calc_y(indx)
        calc_z(indx)
      end 
  end

  def calc_Hpart
    @hpart = *((3 * h)..(n * h)).step(2 * h)
  end

  def plot
  end

end

class DependentSystem < System
end

#binding.pry
