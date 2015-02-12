module Core

  class Flags

    def initialize
      @flags = {
        carry: false,
        parity: false,
        overflow: false,
        zero: false
      }
    end

    def set_on(flag)
      @flags[flag] = true
    end

    def set_off(flag)
      @flags[flag] = false
    end

    def on?(flag)
      @flags[flag]
    end
  end

end
