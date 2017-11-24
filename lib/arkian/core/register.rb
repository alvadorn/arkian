module Arkian
  module Core
    class Register
      attr_reader :word, :high, :low

      def initialize
        @word = 0
        @high = 0
        @low = 0
      end


      def word=(value)
        @word = value & 0xFFFF
        @low = value & 0xFF
        @high = (value >> 8) & 0xFF
      end

      def high=(value)
        @high = value & 0xFF
        word_attrib
      end

      def low=(value)
        @low = value & 0xFF
        word_attrib
      end

      private
      def word_attrib
        @word = (@high << 8) + @low
      end
    end
  end
end
