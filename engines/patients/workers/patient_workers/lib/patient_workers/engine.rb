module PatientWorkers
  class Engine < ::Rails::Engine
    isolate_namespace PatientWorkers

    config.autoload_paths += %W(#{Rails.root}/common)
    config.autoload_paths += %W(#{Rails.root}/app/orchestrator)
    config.autoload_paths += %W(#{Rails.root}/bus)
    config.autoload_paths << File.expand_path("../../../../common", __dir__)
    config.autoload_paths << File.expand_path("../../../../bus", __dir__)
    
  end
end
