module Schedule
  class Engine < ::Rails::Engine
    isolate_namespace Schedule

    config.autoload_paths << File.expand_path("../../../../common", __dir__)
  end
end
