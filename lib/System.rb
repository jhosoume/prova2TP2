#require 'pry'
require 'nyaplot'
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

  def plot(name)
    calc_Hpart
    plot = Nyaplot::Plot.new
    sc = plot.add(:line, @hpart, @xn)
    sc = plot.add(:line, @hpart, @yn)
    sc = plot.add(:line, @hpart, @zn)
    color = Nyaplot::Colors.qual
    sc.color(color)
    plot.export_html("./sys" + name + ".html")

  end


  private
  def first_x
    b1_inverted = b1 ** -1
    xn[1] = xn[0] + h * (a * (yn[0] - xn[0]) * 
                  b1_inverted - @fx.calculate(xn[0]) * b1_inverted) 
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
    first_x
    first_y
    first_z
    for indx in 2..n
      calc_x(indx)
      calc_y(indx)
      calc_z(indx)
    end 
  end

  def calc_Hpart
    @hpart = *((3 * h)..(n * h)).step(2 * h)
  end

end

class DependentSystem < System
  def initialize(n, a, b1, b2, g, rl, fx, h, x0, y0, z0, ref_system)
    @ref_system = ref_system
    super(n, a, b1, b2, g, rl, fx, h, x0, y0, z0)
  end

  def calc_x(indx)
    xn[indx] = @ref_system.xn[indx]
  end

  def calc_y(indx)
    b2_inverted = b2 ** -1
    prev_indx = indx - 2
    yn[indx] = @ref_system.yn[indx] + h * (a * (xn[prev_indx] - yn[prev_indx] ) *
                  b2_inverted + @ref_system.zn[prev_indx] * b2_inverted)  
  end

  def calc_z(indx)
    zn[indx] = @ref_system.zn[indx]
  end
end

#binding.pry
