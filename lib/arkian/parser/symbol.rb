require_relative 'token'

module Arkian
  module Parser
    class SymbolsTable
      def initialize
        @table = []
      end

      def add(lexeme)
        @table << Token.new(lexeme) unless exists? lexeme
      end

      def length
        @table.length
      end

      private

      def exists?(lexeme)
        @table.select { |t| t.lexeme == lexeme }
        @table.any?
      end
    end
  end
end
