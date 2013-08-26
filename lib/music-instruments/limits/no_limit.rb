module Music
module Instruments

class NoLimit
  def self.instance
    new
  end
  
  def allows? value
    true
  end

  private

  def self.new
    super
  end
end

end
end
