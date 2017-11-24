require 'spec_helper'
require 'arkian/lexer/fsm'

describe Arkian::Lexer::FSM do
  describe 'with 1 keyword' do
    before do
      @fsm = Arkian::Lexer::FSM.new
    end

    it 'is 0-length graph with blank keyword' do
      @fsm.new_keyword ''
      @fsm.graph_length.must_equal 0
    end

    it 'is 3-length graph valid when keyword is ADD' do
      @fsm.new_keyword 'ADD'

      result = {
        1 => {
          'a' => 2
        },
        2 => {
          'd' => 3
        },
        3 => {
          'd' => 0
        }
      }

      @fsm.graph.must_equal result
      @fsm.graph_length.must_equal 3
    end

    it 'is 4-length graph valid when keyword is IDIV' do
      @fsm.new_keyword 'IDIV'

      result = {
        1 => {
          'i' => 2
        },
        2 => {
          'd' => 3
        },
        3 => {
          'i' => 4
        },
        4 => {
          'v' => 0
        }
      }

      @fsm.graph.must_equal result
      @fsm.graph_length.must_equal 4
    end
  end
end
