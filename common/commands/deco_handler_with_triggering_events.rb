# Decorator for command to add triggering events
class DecoHandlerWithTriggeringEvents
  
  def initialize(klass, run, get_messages)
    @klass = klass
    @run = run
    @get_messages = get_messages
  end

  def run
    # get any messages to be sent
    logger.info "retrieving messages to be sent for #{ @klass } ..."
    messages = @get_messages.call()
    logger.info "#{ messages.length } message(s) have been found attached to #{@klass} "
    
    #execute command handler
    command_result = @run.call()

    # send messages
    if messages.any?
      logger.info "sending  messages ..."
      messages.each do |msg|
        logger.warn msg.message
        PetalBus.send_message(msg)
      end
    end

    return command_result
  end

  def logger
    PocLogger.new
  end
end
