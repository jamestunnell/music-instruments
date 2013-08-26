require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LowerLimitInclusive do
  describe '#allow?' do
    before :all do
      @limit = LowerLimitInclusive.new(2)
    end

    context 'given a value that is at the lower limit' do
      it 'should return true' do
        @limit.allows?(2).should be_true
      end
    end

    context 'given a value that is above the lower limit' do
      it 'should return true' do
        @limit.allows?(2 + 0.0001).should be_true
        @limit.allows?(1e15).should be_true
      end
    end

    context 'given a value that is below the lower limit' do
      it 'should return false' do
        @limit.allows?(2 - 1e-5).should be_false
        @limit.allows?(0).should be_false
      end
    end
  end
end

describe LowerLimitExclusive do
  describe '#allow?' do
    before :all do
      @limit = LowerLimitExclusive.new(2)
    end

    context 'given a value that is at the lower limit' do
      it 'should return false' do
        @limit.allows?(2).should be_false
      end
    end

    context 'given a value that is above the lower limit' do
      it 'should return true' do
        @limit.allows?(2 + 0.0001).should be_true
        @limit.allows?(1e15).should be_true
      end
    end

    context 'given a value that is below the lower limit' do
      it 'should return false' do
        @limit.allows?(2 - 1e-5).should be_false
        @limit.allows?(0).should be_false
      end
    end
  end
end
