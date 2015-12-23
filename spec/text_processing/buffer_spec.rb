require_relative '../../src/text_processing/buffer'

describe 'Emulator::TextProcessing::Buffer', '#buffer' do

  context 'buffering' do
    it 'open an inexistent file' do
      buffer = Emulator::TextProcessing::Buffer.new "unknow.asm"
      expected_type = Hash
      expected = "File not found"

      result = buffer.next_char
      result_type = result.class
      result = result[:error]

      expect(result).to eq(expected)
      expect(result_type).to eq(expected_type)
    end

    it 'open an existent file and read first char' do
      buffer = Emulator::TextProcessing::Buffer.new "examples/simple.asm"
      expected_type = String
      expected = "o"

      result = buffer.next_char
      result_type = result.class

      expect(result_type).to eq(expected_type)
      expect(result).to eq(expected)
    end
  end
end
