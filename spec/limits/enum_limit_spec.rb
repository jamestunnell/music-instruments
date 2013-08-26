require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EnumLimit do
  describe '#allow?' do
    before :all do
      @limit = EnumLimit.new [1,3,5,7,9]
    end

    context 'given a value that is included in list' do
      it 'should return true' do
        @limit.allows?(1).should be_true
        @limit.allows?(3).should be_true
      end
    end

    context 'given a value that is not included in list' do
      it 'should return false' do
        @limit.allows?(2).should be_false
        @limit.allows?(4).should be_false
      end
    end
  end
end
