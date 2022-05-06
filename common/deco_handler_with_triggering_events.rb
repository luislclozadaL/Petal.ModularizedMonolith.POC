# Decorator for command to add triggering events
class DecoHandlerWithTriggeringEvents
  
  def initialize(command)
    @command = command
  end

  def run
    # get any messages to be sent
    puts "retrieves messages to be sent"
    #execute command handler
    command_result = @command.run

    # send messages
    puts "send messages"

    return command_result
  end
end
