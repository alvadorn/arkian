module Arkian
  module Lexer
    class FSM
      def initialize
        @tree = {}
        @state = 1
        @state_counter = 1
      end

      def new_keyword(keyword)
        process_keyword keyword
      end

      def graph_length
        @tree.keys.length
      end

      def graph
        @tree
      end

      private

      def process_keyword(keyword)
        length = keyword.length
        keyword.chomp.downcase.each_char.with_index(1) do |c, i|
          @tree[@state] = {} unless @tree.key? @state

          if @tree[@state].key? c
            @state = @tree[@state][c]
          else
            if length == i
              @tree[@state][c] = 0
              @state = 1
            else
              @state_counter += 1
              @tree[@state][c] = @state_counter
              @state = @state_counter
            end
          end
        end
      end
    end
  end
end
