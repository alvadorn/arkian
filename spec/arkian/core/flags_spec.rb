require 'spec_helper'
require 'arkian/core/flags'

describe Arkian::Core::Flags do
  before do
    @flags = Arkian::Core::Flags.new
  end

  describe 'verifying' do
    it 'recently initialized are off' do
      @flags.on?(:carry).wont_be_same_as true
      @flags.on?(:overflow).wont_be_same_as true
      @flags.on?(:parity).wont_be_same_as true
      @flags.on?(:zero).wont_be_same_as true
    end

    it 'set carry on and verify' do
      @flags.on :carry
      @flags.on?(:carry).must_be_same_as true
    end
  end
end
