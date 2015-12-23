require_relative '../../src/parser/symbol'
require_relative '../../src/parser/token'

describe 'Emulator::Parser::Symbol' do
  context 'adding some tokens' do
    before do
      @table = Emulator::Parser::SymbolsTable.new
    end

    it 'and verifying table size with no add' do
      expect(@table.length).to eq 0
    end

    it 'and verify table size after one add' do
      @table.add "org"
      expect(@table.length).to eq 1
    end

    it 'and verify table size after two equal adds' do
      @table.add "org"
      @table.add "org"
      expect(@table.length).to eq 1
    end

  end
end
