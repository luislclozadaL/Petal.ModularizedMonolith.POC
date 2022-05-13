require "bunny"

class BusManager
    attr_accessor :active_connection, :active_channel
    include Singleton

    def initialize
        start_connection
    end

    def start_connection()
        @connection = Bunny.new('amqp://admin:password@localhost:5672/development')
        @connection.start
        @active_channel = @connection.create_channel
        exchange = @active_channel.topic("dev_exchange", :auto_delete => false, :durable => true)

        @active_connection
    end

    def connection
        return active_connection if connected?
        start_connection

        active_connection
    end

    def channel
        return active_channel if connected? && active_channel&.open?
        start_connection

        active_channel
    end

    def connected?
        active_connection&.connected?
    end

end