
class BaseMessage
    
    def initialize(message, message_topic, message_identifier = nil)
        @message = message
        @message_topic = message_topic
        @message_identifier = message_identifier
    end

    def message
        @message
    end 

    def message_topic
        @message_topic
    end

    def message_identifier
        @message_identifier
    end

end 

