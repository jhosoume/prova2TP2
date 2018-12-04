require './lib/System'
require './lib/Fx'

fx = Fx.new(-0.7879, # m0
            -1.4357, # m1
             1)      # Bp
sys_one = System.new(10000,          # n
                    0.9259,         # a
                    0.15,           # b1
                    1.5,            # b2
                    0.1,            # g
                    0.002,          # rl
                    fx,
                    0.02,           # h
                    0.1,            # x0
                    0.1,            # y0
                    0.1)            # z0

sys_one.plot
