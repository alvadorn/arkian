module Core
  class Register
    def initialize
      @info = { word: 0, high: 0, low: 0 }
    end

    def set(value, size = :word)
      @info = case size
							when :low
								{ word: (@info[:high] << 8) + value, high: @info[:high],
									low: value }
							when :high
								{ word: (value << 8) + @info[:low], high: value,
									low: @info[:low] }
							else
								{ word: value, high: (value >> 8) & 0xFF, low: value & 0xFF }
							end
    end

    def low
      @info[:low]
    end

    def high
      @info[:high]
    end

    def word
      @info[:word]
    end
  end
end
