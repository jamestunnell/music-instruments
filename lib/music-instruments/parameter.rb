module Music
module Instruments

class Parameter
  class IncorrectArityError < StandardError; end

  attr_reader :limit

  def initialize get_val_handler, set_val_handler, limit = NoLimit.instance
    if get_val_handler.arity != 0
      raise IncorrectArityError, "get_value_handler.arity is not 0"
    end
    
    if set_val_handler.arity != 1
      raise IncorrectArityError, "set_value_handler.arity is not 1"
    end

    @set_value_handler = set_val_handler
    @get_value_handler = get_val_handler
    @limit = limit
  end

  def allows? value
    @limit.allows? value
  end

  # Set the parameter to the given value.
  def set_value value
    if allows? value
      @set_value_handler.call value
    end
  end
  
  # Get the parameter's current value.
  def get_value
    @get_value_handler.call
  end
end

end
end