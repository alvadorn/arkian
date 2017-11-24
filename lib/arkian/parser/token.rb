module Arkian
  module Parser
    class Token
      attr_accessor :lexeme

      def initialize(lexeme)
        @lexeme = lexeme
      end
    end
  end
end
