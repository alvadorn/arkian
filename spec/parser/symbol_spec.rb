require_relative '../../src/parser/symbol'
require_relative '../../src/parser/token'
require 'minitest/autorun'

describe Emulator::Parser::SymbolsTable do
  describe 'adding some tokens' do
    before do
      @table = Emulator::Parser::SymbolsTable.new
    end

    it 'and verifying table size with no add' do
      @table.length.must_equal 0
    end

    it 'and verify table size after one add' do
      @table.add "org"
      @table.length.must_equal 1
    end

    it 'and verify table size after two equal adds' do
      @table.add "org"
      @table.add "org"
      @table.length.must_equal 1
    end

  end
end
