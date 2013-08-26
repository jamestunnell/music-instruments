require 'spec_helper'

describe Parameter do
  before :each do 
    @get_handler_was_invoked = false
    @set_handler_was_invoked = false
    @start = 1
    @a = @start
    @param = Parameter.new(
      ->(){ @get_handler_was_invoked = true; return @a },
      ->(b){ @set_handler_was_invoked = true; @a = b }
    )
  end

  it 'should default to NoLimit limit' do
    @param.limit.should be_a NoLimit    
  end

  describe '#get_value' do
    it 'should invoke the get_value_handler' do
      @param.get_value
      @get_handler_was_invoked.should be_true
    end

    it 'should return the return value of the get_value_handler' do
      @param.get_value.should eq @start
    end
  end

  describe '#set_value' do
    it 'should invoke the set_value_handler when set_value is called' do
      @param.set_value(@start + 1)
      @set_handler_was_invoked.should be_true
    end

    it 'should pass the given value to the set_value_handler' do
      @param.set_value(@start + 2)
      @param.get_value.should eq(@start + 2)
    end

    it 'should only set value if #allows? is true' do
      value = 7
      param = Parameter.new(
        ->(){ return value },
        ->(v){ value = v },
        EnumLimit.new([1,3,5,7])
      )

      param.allows?(6).should be_false
      param.set_value(6)
      value.should eq(7)
      param.allows?(5).should be_true
      param.set_value(5)
      value.should eq(5)
    end
  end

  describe '#allows?' do
    before :each do
      @set_handler_was_invoked = false
      @value2 = 7
      @param2 = Parameter.new(
        ->(){ return @value2 },
        ->(v){ @set_handler_was_invoked = true; @value2 = v },
        EnumLimit.new([1,3,5,7])
      )
    end

    context 'allowed value given' do
      it 'should return true' do
        @param2.allows?(5).should be_true
      end
    end

    context 'allowed value given' do
      it 'should return true' do
        @param2.allows?(6).should be_false
      end
    end
  end
end
