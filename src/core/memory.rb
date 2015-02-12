module Core
  
  class Memory

    TYPE = { byte: 1,
             word: 2,
             dword: 4,
             qword: 8
           }

    def initialize(fild = Hash.new)
      @memory = fild
    end

    def empty?
      @memory.empty?
    end

    def set(position, value, size = :byte)
      if position > 65535
        raise Error
      else
        0.upto(TYPE[size] - 1) do |i|
          @memory[position.to_s.to_sym] = value >> (i * 8) & 0xFF
          position += 1
        end
      end
    end

    def get(position, size = :byte)
      if position > 65535
        raise Error
      else
        value = 0
        0.upto(TYPE[size] - 1) do |i|
          value += @memory[position.to_s.to_sym] << (i * 8)
          position += 1
        end
        value
      end
    end

  end

end
