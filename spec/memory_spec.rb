require_relative '../src/memory'

describe Memory, '#memory' do

  before(:each) do
    @m = Memory.new
  end

  context 'reading' do
    it 'should be blank with no initialize' do
      expect(@m.empty?).to be true
    end

    it 'a byte' do
      @m.set(55, 0x30)
      expect(@m.get(55)).to eq 0x30
    end

    it 'a word' do
      @m.set(55, 0xFF35, :word)
      expect(@m.get(55, :word)).to eq 0xFF35
    end

    it 'a dword' do
      value = 0x11_35_FF_96
      @m.set(55, value, :dword)
      expect(@m.get(55, :dword)).to eq value
    end

    it 'a qword' do
        value = 0x3956_8912_7896_4100
        @m.set(65000, value, :qword)
        expect(@m.get(65000, :qword)).to eq value
    end
  end

end
