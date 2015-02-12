require_relative '../../src/core/register'

describe Core::Register, '#register' do
  before do
    @register = Core::Register.new
  end

  context 'allocating new register' do
    it 'and do nothing' do
      expect(@register.word).to eq(0)
      expect(@register.high).to eq(0)
      expect(@register.low).to eq(0)
    end

    it 'and saving in low' do
      @register.set(0xFF, :low)
      expect(@register.low).to eq(0xFF)
      expect(@register.word).to eq(0xFF)
    end

    it 'and saving in high' do
      @register.set(0xFF, :high)
      expect(@register.high).to eq(0xFF)
      expect(@register.word).to eq(0xFF00)
    end

    it 'and saving in word' do
      @register.set(0xF236)
      expect(@register.word).to eq(0xF236)
      expect(@register.low).to eq(0x36)
      expect(@register.high).to eq(0xF2)
    end

    it 'and resaving low value' do
      @register.set(0xFF22)
      @register.set(0x44, :low)
      expect(@register.word).to eq(0xFF44)
      expect(@register.low).to eq(0x44)
      expect(@register.high).to eq(0xFF)
    end

    it 'and resaving high value' do
      @register.set(0x3322)
      @register.set(0x99, :high)
      expect(@register.word).to eq(0x9922)
      expect(@register.high).to eq(0x99)
      expect(@register.low).to eq(0x22)
    end

    it 'and resaving all values' do
      @register.set(0x3424)
      @register.set(0x36, :low)
      @register.set(0xF7, :high)
      expect(@register.word).to eq(0xF736)
      expect(@register.high).to eq(0xF7)
      expect(@register.low).to eq(0x36)
    end

  end


end
