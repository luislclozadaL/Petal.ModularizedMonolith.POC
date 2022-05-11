module Schedule
  class Engine < ::Rails::Engine
    isolate_namespace Schedule

    config.autoload_paths << File.expand_path("../../../../common", __dir__)
    config.autoload_paths << File.expand_path("../../../../bus", __dir__)
    config.logger = Logger.new(STDOUT)
    Rails.logger = Logger.new(STDOUT)
    config.log_level = :debug
  end
end
