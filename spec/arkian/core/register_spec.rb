require 'spec_helper'
require 'arkian/core/register'

describe Arkian::Core::Register do
  before do
    @register = Arkian::Core::Register.new
  end

  describe 'allocating new register' do
    it 'and do nothing' do
      @register.word.must_equal 0
      @register.high.must_equal 0
      @register.low.must_equal 0
    end

    it 'and saving in low' do
      @register.low = 0xFF
      @register.low.must_equal 0xFF
      @register.high.must_equal 0x00
      @register.word.must_equal 0xFF
    end

    it 'and saving in high' do
      @register.high = 0xFF
      @register.high.must_equal 0xFF
      @register.low.must_equal 0x00
      @register.word.must_equal 0xFF00
    end

    it 'and saving in word' do
      @register.word = 0xF236
      @register.word.must_equal 0xF236
      @register.low.must_equal 0x36
      @register.high.must_equal 0xF2
    end

    it 'and resaving low value' do
      @register.word = 0xFF22
      @register.low = 0x44
      @register.word.must_equal 0xFF44
      @register.low.must_equal 0x44
      @register.high.must_equal 0xFF
    end

    it 'and resaving high value' do
      @register.word = 0x3322
      @register.high = 0x99
      @register.word.must_equal 0x9922
      @register.high.must_equal 0x99
      @register.low.must_equal 0x22
    end

    it 'and resaving all values' do
      @register.word = 0x3424
      @register.low = 0x36
      @register.high = 0xF7
      @register.word.must_equal 0xF736
      @register.high.must_equal 0xF7
      @register.low.must_equal 0x36
    end
  end
end
