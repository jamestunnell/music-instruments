module Music
module Instruments

class LowerLimitInclusive
  def initialize lowest_allowed
    @lowest_allowed = lowest_allowed
  end

  def allows? value
    value >= @lowest_allowed 
  end
end

class LowerLimitExclusive
  def initialize lowest_allowed
    @lowest_allowed = lowest_allowed
  end

  def allows? value
    value > @lowest_allowed
  end
end

end
end
