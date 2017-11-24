require 'spec_helper'
require 'arkian/core/memory'

describe Arkian::Core::Memory do
  before(:each) do
    @m = Arkian::Core::Memory.new
  end

  describe 'reading' do
    it 'should be blank with no initialize' do
      @m.must_be_empty
    end

    it 'a byte' do
      @m.set(55, 0x30)
      @m.get(55).must_equal 0x30
    end

    it 'a word' do
      @m.set(55, 0xFF35, :word)
      @m.get(55, :word).must_equal 0xFF35
    end

    it 'a dword' do
      value = 0x11_35_FF_96
      @m.set(55, value, :dword)
      @m.get(55, :dword).must_equal value
    end

    it 'a qword' do
      value = 0x3956_8912_7896_4100
      @m.set(65_000, value, :qword)
      @m.get(65_000, :qword).must_equal value
    end
  end
end
