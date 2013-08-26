require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe RangeLimit do
  describe '#allow?' do
    context 'given an inclusive lower limit and exclusive upper limit' do
      before :all do
        @limit = RangeLimit.new LowerLimitInclusive.new(2), UpperLimitExclusive.new(5.5)
      end

      context 'given a value that is at the lower limit' do
        it 'should return true' do
          @limit.allows?(2).should be_true
        end
      end

      context 'given a value that is greater than the lower limit and less than the upper limit' do
        it 'should return true' do
          @limit.allows?(3).should be_true
          @limit.allows?(5.5 - 1e-5).should be_true
        end
      end

      context 'given a value that is less than the lower limit' do
        it 'should return false' do
          @limit.allows?(2 - 1e-5).should be_false
        end
      end

      context 'given a value that is at the upper limit' do
        it 'should return false' do
          @limit.allows?(5.5).should be_false
        end
      end
    end    
  end
end
