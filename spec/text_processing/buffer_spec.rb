require_relative '../../src/text_processing/buffer'
require 'minitest/autorun'

describe Emulator::TextProcessing::Buffer do

  describe 'buffering' do
    it 'open an inexistent file' do
      buffer = Emulator::TextProcessing::Buffer.new "examples/unknow.asm"

      result = buffer.next_char
      result_type = result.class
      result = result[:error]

      result.must_equal "File not found"
      result_type.must_equal Hash
    end

    it 'open an existent file and read first char' do
      buffer = Emulator::TextProcessing::Buffer.new "examples/simple.asm"

      result = buffer.next_char
      result_type = result.class

      result_type.must_equal String
      result.must_equal "o"
    end
  end
end
