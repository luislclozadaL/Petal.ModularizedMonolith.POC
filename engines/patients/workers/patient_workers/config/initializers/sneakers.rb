Sneakers.configure  :heartbeat => 10,
                    :amqp => 'amqp://admin:password@localhost:5672/',
                    :vhost => 'development',
                    :exchange => 'dev_exchange',
                    :exchange_type => :topic
                    # more configuration options...

Sneakers.logger.level = Logger::DEBUG

