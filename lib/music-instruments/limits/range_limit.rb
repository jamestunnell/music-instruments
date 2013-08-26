module Music
module Instruments

class RangeLimit
  attr_reader :lower_limit, :upper_limit

  def initialize lower_limit, upper_limit
    @lower_limit = lower_limit
    @upper_limit = upper_limit
  end

  def allows? value
    @lower_limit.allows?(value) && @upper_limit.allows?(value)
  end
end

end
end
