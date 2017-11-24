require 'spec_helper'
require 'arkian/text_processing/buffer'

describe Arkian::TextProcessing::Buffer do
  describe 'buffering' do
    it 'open an inexistent file' do
      buffer = Arkian::TextProcessing::Buffer.new 'examples/unknow.asm'

      result = buffer.next_char
      result_type = result.class
      result = result[:error]

      result.must_equal 'File not found'
      result_type.must_equal Hash
    end

    it 'open an existent file and read first char' do
      buffer = Arkian::TextProcessing::Buffer.new 'examples/simple.asm'

      result = buffer.next_char
      result_type = result.class

      result_type.must_equal String
      result.must_equal 'o'
    end
  end
end
