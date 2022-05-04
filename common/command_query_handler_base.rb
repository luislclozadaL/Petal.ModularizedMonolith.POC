# Base class for CommandQueryHandler (Actual Implementation)

class CommandQueryHandlerBase
  def initialize(*params)
    raise 'custom params should be handled by child class'
  end
end
