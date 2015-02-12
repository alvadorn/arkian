module Core

  class Flags

    def initialize
      @flags = {
        carry: :off,
        parity: :off,
        overflow: :off,
        zero: :off
      }
    end

    def set_on(flag)
      @flags[flag] = :on
    end

    def set_off(flag)
      @flags[flag] = :off
    end

    def on?(flag)
      return true if @flags[flag].eql? :on
      false
      #@flags[flag].eql? :on  ? true : false
    end
  end

end
