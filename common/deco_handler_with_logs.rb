# Decorator for commands to add generic logs
class DecoHandlerWithLogs
  
  def initialize(command)
    @command = command
  end

  def run
    logger.info "Attempting to invoke #{ @command.class }"
    start_time = Time.now

    #execute command handler
    command_result = @command.run
    
    end_time = Time.now
    logger.info "#{ @command.class } executed succesfully in #{ end_time - start_time } seconds "

    return command_result
  end

  def logger
    Rails.logger
  end
end
