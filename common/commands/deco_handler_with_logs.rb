# Decorator for commands to add generic logs
class DecoHandlerWithLogs
  
  def initialize(klass, run)
    @klass = klass
    @run = run
  end

  def run
    logger.info "Attempting to invoke #{ @klass }"
    start_time = Time.now

    #execute command handler
    command_result = @run.call
    
    end_time = Time.now
    logger.info "#{ @klass } executed succesfully in #{ end_time - start_time } seconds "

    return command_result
  end

  def logger
    PocLogger.new
  end
end
