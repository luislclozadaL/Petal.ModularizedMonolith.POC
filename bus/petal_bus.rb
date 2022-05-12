require 'json'

class PetalBus

    RABBIT_OPTIONS = {durable: true, auto_delete: false}.freeze

    def self.send_message(message)
        channel = BusManager.instance.channel
        queue = channel.queue(message.get_queue, RABBIT_OPTIONS)
        queue.publish(message.to_json, routing_key: message.message_topic)
    end

end