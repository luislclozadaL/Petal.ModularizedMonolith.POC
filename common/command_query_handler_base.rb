# Base class for CommandQueryHandler (Actual Implementation)

class CommandQueryHandlerBase

  def initialize(*params)
    raise 'custom params should be handled by child class'
  end

  # runs the command with decorators
  def invoke
    command = decorate_command()

    return command.run()
  end
  
  # runs the command without decorators
  def run
    raise 'run method must be overwritten by child class'
  end

  def get_messages
      return []
  end

  private def decorate_command
    #grab original methods
    current_get_messages = method(:get_messages)
    current_run = method(:run)

    #add decorator to trigger events / publish messages
    deco_with_messages = DecoHandlerWithTriggeringEvents.new(self.class, current_run, current_get_messages)

    #add decorator to add logs
    deco_with_logs = DecoHandlerWithLogs.new(self.class, deco_with_messages.method(:run))
    return deco_with_logs
  end
end
