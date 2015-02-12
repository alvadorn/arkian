require_relative '../src/core/flags'

describe Core::Flags, '#flags' do

  before do
    @flags = Core::Flags.new
  end

  context 'verifying' do
    it 'recently initialized are off' do
      expect(@flags.on? :carry).to be false
      expect(@flags.on? :overflow).to be false
      expect(@flags.on? :parity).to be false
      expect(@flags.on? :zero).to be false
    end

    it 'set carry on and verify' do
       @flags.set_on :carry
       expect(@flags.on? :carry).to be true
    end
  end

end
