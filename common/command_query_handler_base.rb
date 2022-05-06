# Base class for CommandQueryHandler (Actual Implementation)

class CommandQueryHandlerBase
  def initialize(*params)
    raise 'custom params should be handled by child class'
  end

  # runs the command and triggers the messages tied to it
  def invoke
    decorated_command = DecoHandlerWithTriggeringEvents.new(DecoHandlerWithLogs.new(self))

    return decorated_command.run
  end
  
  # runs the command without triggering the messages tied to it
  # must be implementd by child class
  def run
    raise 'run method must be overwritten by child class'
  end
end
