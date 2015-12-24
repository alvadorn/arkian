require_relative '../../src/text_processing/lexer'

describe Emulator::TextProcessing::Lexer do

  describe 'simple test' do
    it 'and count number of symbols' do
      lexer = Emulator::TextProcessing::Lexer.new "examples/simple.asm"
      lexer.run
      #lexer.symbols.length.must_equal 2
    end
  end

  describe 'simple strings process' do
    before do
      @lexer = Emulator::TextProcessing::Lexer.new
    end

    it 'org last state is 11' do
      @lexer.string_process("org").must_equal 11
    end

    it '(+/-)100 last state is 6' do
      @lexer.string_process("100").must_equal 6
      @lexer.string_process("+100").must_equal 6
      @lexer.string_process("-100").must_equal 6
    end

    it '0b101 last state is 5' do
      @lexer.string_process("0b101").must_equal 5
      @lexer.string_process("0B101").must_equal 5
    end

    it '0xA019F last state is 3' do
      @lexer.string_process("0xA019F").must_equal 3
      @lexer.string_process("0XA019F").must_equal 3
    end

    it '(+/-)1123.4232324 last state is 8' do
      @lexer.string_process("-1123.4232324").must_equal 8
      @lexer.string_process("1123.4232324").must_equal 8
    end

  end

end
