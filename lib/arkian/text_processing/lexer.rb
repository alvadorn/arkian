require_relative '../parser/symbol'
require_relative 'buffer'

module Arkian
  module TextProcessing
    class Lexer
      END_STATES = [3, 5, 6, 8, 10, 11, 12, 15, 22].freeze
      END_CONTINUE_STATES = [3, 5, 6, 8, 11, 12].freeze

      attr_reader :symbols
      def initialize(filename = '')
        @symbols = Arkian::Parser::SymbolsTable.new
        @buffer = Buffer.new filename
      end

      def run
        str = ''
        received = ''
        state = 0
        received = @buffer.next_char while received.class == String
      end

      def string_process(str)
        state = 0
        old_state = 0
        str.each_char do |char|
          old_state = state
          state = next_state(char, state)
          state = old_state if state == -1
        end
        state
      end

      private

      def is_ender_continue_state?(state)
        END_CONTINUE_STATES.include? state
      end

      def is_ender_state?(state)
        END_STATES.include? state
      end

      def next_state(char, from)
        case from
        when 0
          from_state_zero char
        when 1
          from_state_one char
        when 2
          from_state_two char
        when 3
          from_state_three char
        when 4
          from_state_four char
        when 5
          from_state_five char
        when 6
          from_state_six char
        when 7
          from_state_seven char
        when 8
          from_state_eight char
        when 9
          from_state_nine char
        when 11
          from_state_eleven char
        when 12
          from_state_twelve char
        when 13
          from_state_thirteen char
        when 14
          from_state_fourteen char
        when 16
          from_state_sixteen char
        when 17
          from_state_seventeen char
        when 18
          from_state_eighteen char
        when 19
          from_state_nineteen char
        when 20
          from_state_twenty char
        when 21
          from_state_twenty_one char
        when 23
          from_state_twenty_three char
        when 24
          from_state_twenty_four char
        when 25
          from_state_twenty_five char
        when 26
          from_state_twenty_six char
        when 27
          from_state_twenty_seven char
        when 28
          from_state_twenty_eight char
        else
          -1
        end
      end

      def from_state_zero(char)
        if char == '0'
          1
        elsif char =~ /[1-9]/
          6
        elsif char == '-'
          9
        elsif char == ':'
          10
        elsif letter? char
          11
        elsif char == '['
          13
        elsif char == ','
          22
        else
          -1
        end
      end

      def from_state_one(char)
        if char =~ /(x|X)/
          2
        elsif char =~ /(b|B)/
          4
        elsif digit? char
          6
        else
          -1
        end
      end

      def from_state_two(char)
        if hex? char
          3
        else
          -1
        end
      end

      def from_state_four(char)
        if char =~ /[0-1]/
          5
        else
          -1
        end
      end

      def from_state_six(char)
        if digit? char
          6
        elsif char == '.'
          7
        else
          -1
        end
      end

      def from_state_seven(char)
        if digit? char
          8
        else
          -1
        end
      end

      def from_state_nine(char)
        if digit? char
          6
        else
          -1
        end
      end

      def from_state_eleven(char)
        if letter? char
          11
        elsif digit? char
          12
        else
          -1
        end
      end

      def from_state_twelve(char)
        if char =~ /\w/
          12
        else
          -1
        end
      end

      def from_state_thirteen(char)
        if letter? char
          16
        elsif char =~ /\d/
          14
        else
          -1
        end
      end

      def from_state_fourteen(char)
        if char =~ /\d/
          14
        elsif close_bracket? char
          15
        elsif op_symbol? char
          23
        else
          -1
        end
      end

      def from_state_sixteen(char)
        if letter? char
          16
        elsif op_symbol? char
          17
        elsif close_bracket? char
          15
        else
          -1
        end
      end

      def from_state_seventeen(char)
        if letter? char
          19
        elsif char =~ /\d/
          18
        else
          -1
        end
      end

      def from_state_eighteen(char)
        if close_bracket? char
          15
        elsif op_symbol? char
          27
        elsif char =~ /\d/
          18
        else
          -1
        end
      end

      def from_state_nineteen(char)
        if letter? char
          19
        elsif op_symbol? char
          20
        else
          -1
        end
      end

      def from_state_twenty(char)
        if digit? char
          21
        else
          -1
        end
      end

      def from_state_twenty_one(char)
        if close_bracket? char
          15
        else
          -1
        end
      end

      def from_state_twenty_three(char)
        if letter? char
          24
        else
          -1
        end
      end

      def from_state_twenty_four(char)
        if letter? char
          24
        elsif op_symbol? char
          25
        elsif close_bracket? char
          15
        else
          -1
        end
      end

      def from_state_twenty_five(char)
        if letter? char
          26
        else
          -1
        end
      end

      def from_state_twenty_six(char)
        if letter? char
          26
        elsif close_bracket? char
          15
        else
          -1
        end
      end

      def from_state_twenty_seven(char)
        if letter? char
          28
        else
          -1
        end
      end

      def from_state_twenty_eight(char)
        if letter? char
          28
        elsif close_bracket? char
          15
        else
          -1
        end
      end

      def hex?(char)
        char =~ /(\d|[a-f]|[A-F])/
      end

      def letter?(char)
        char =~ /([A-Z]|[a-z])/
      end

      def op_symbol?(char)
        char =~ /(\+|\-)/
      end

      def digit?(char)
        char =~ /\d/
      end

      def close_bracket?(char)
        char == ']'
      end

      alias from_state_three from_state_two
      alias from_state_five from_state_four
      alias from_state_eight from_state_seven
    end
  end
end
