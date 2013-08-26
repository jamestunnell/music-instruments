require 'spec_helper'

class FakeInstr < Instrument
  def initialize params = {}, presets = {}
    super(
      :sample_rate => 1000,
      :key_maker => ->(){},
      :parameters => params,
      :presets => presets
    )
  end
end

describe Instrument do
  describe '#apply_setting' do
    it 'should call set_value on the given param' do
      a = 1
      i = FakeInstr.new( { :a => Parameter.new(->(){ a }, ->(b){ a = b}) } )
      i.apply_setting(:a,2)
      a.should eq(2)
    end
  end

  describe '#apply_setting' do
    it 'should call apply_setting for each key/val pair in given hash' do
      a = 1
      b = 10
      i = FakeInstr.new({ 
        :a => Parameter.new(->(){ a }, ->(v){ a = v}),
        :b => Parameter.new(->(){ b }, ->(v){ b = v}),
      })
      i.apply_settings(:a => 2, :b => 11)
      a.should eq(2)
      b.should eq(11)
    end
  end

  describe '#apply_preset' do
    it 'should call apply_setting using the key/val pairs from the given preset' do
      a = 1
      i = FakeInstr.new( { :a => Parameter.new(->(){ a }, ->(b){ a = b}) }, :default => {:a => 2} )
      i.apply_preset(:default)
      a.should eq(2)
    end
  end

  describe '#apply_presets' do
    it 'should call apply_preset for each key/val pair in given hash' do
      a = 1
      b = 10
      i = FakeInstr.new({ 
        :a => Parameter.new(->(){ a }, ->(v){ a = v}),
        :b => Parameter.new(->(){ b }, ->(v){ b = v}),
      }, :a_default => { :a => 2 }, :b_default => { :b => 11 })
      i.apply_presets([:a_default, :b_default])
      a.should eq(2)
      b.should eq(11)
    end
  end

  describe '#configure' do
    it 'should call apply_presets for given preset keys' do
      a = 1
      b = 10
      i = FakeInstr.new({ 
        :a => Parameter.new(->(){ a }, ->(v){ a = v}),
        :b => Parameter.new(->(){ b }, ->(v){ b = v}),
      }, :a_default => { :a => 2 }, :b_default => { :b => 11 })
      i.configure([:a_default, :b_default])
      a.should eq(2)
      b.should eq(11)      
    end

    it 'should call apply_settings for given settings hash' do
      a = 1
      b = 10
      i = FakeInstr.new({ 
        :a => Parameter.new(->(){ a }, ->(v){ a = v}),
        :b => Parameter.new(->(){ b }, ->(v){ b = v}),
      }, :a_default => { :a => 2 }, :b_default => { :b => 11 })
      i.configure([], :a => 3, :b => 12)
      a.should eq(3)
      b.should eq(12)
    end
  end
end
