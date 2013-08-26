module Music
module Instruments

class UpperLimitInclusive
  def initialize highest_allowed
    @highest_allowed = highest_allowed
  end

  def allows? value
    value <= @highest_allowed 
  end
end

class UpperLimitExclusive
  def initialize highest_allowed
    @highest_allowed = highest_allowed
  end

  def allows? value
    value < @highest_allowed
  end
end

end
end
