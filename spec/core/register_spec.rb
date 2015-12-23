require_relative '../../src/core/register'

require 'minitest/autorun'

describe Core::Register do
  before do
    @register = Core::Register.new
  end

  describe 'allocating new register' do
    it 'and do nothing' do
      @register.word.must_equal 0
      @register.high.must_equal 0
      @register.low.must_equal 0
    end

    it 'and saving in low' do
      @register.set(0xFF, :low)
      @register.low.must_equal 0xFF
      @register.high.must_equal 0x00
      @register.word.must_equal 0xFF
    end

    it 'and saving in high' do
      @register.set(0xFF, :high)
      @register.high.must_equal 0xFF
      @register.low.must_equal 0x00
      @register.word.must_equal 0xFF00
    end

    it 'and saving in word' do
      @register.set(0xF236)
      @register.word.must_equal 0xF236
      @register.low.must_equal 0x36
      @register.high.must_equal 0xF2
    end

    it 'and resaving low value' do
      @register.set(0xFF22)
      @register.set(0x44, :low)
      @register.word.must_equal 0xFF44
      @register.low.must_equal 0x44
      @register.high.must_equal 0xFF
    end

    it 'and resaving high value' do
      @register.set(0x3322)
      @register.set(0x99, :high)
      @register.word.must_equal 0x9922
      @register.high.must_equal 0x99
      @register.low.must_equal 0x22
    end

    it 'and resaving all values' do
      @register.set(0x3424)
      @register.set(0x36, :low)
      @register.set(0xF7, :high)
      @register.word.must_equal 0xF736
      @register.high.must_equal 0xF7
      @register.low.must_equal 0x36
    end
  end
end
