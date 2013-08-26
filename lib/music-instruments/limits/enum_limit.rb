module Music
module Instruments

class EnumLimit
  attr_reader :allowed_values

  def initialize allowed_values
    @allowed_values = allowed_values
  end

  def allows? value
    allowed_values.include? value
  end
end

end
end
