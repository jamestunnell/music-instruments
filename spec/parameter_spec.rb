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

    it 'should use whatever limit is given to disallow certain values' do
      set_handler_was_invoked = false
      value = 7

      p = Parameter.new(
        ->(){ return value },
        ->(v){ set_handler_was_invoked = true; value = v },
        EnumLimit.new([1,3,5,7])
      )

      p.set_value(6)
      set_handler_was_invoked.should be_false
      p.set_value(5)
      set_handler_was_invoked.should be_true
    end
  end
end
