module Patients
  class Engine < ::Rails::Engine
    isolate_namespace Patients

    config.autoload_paths << File.expand_path("../../../../common", __dir__)
    config.autoload_paths << File.expand_path("../../../../common/commands", __dir__)
    config.autoload_paths << File.expand_path("../../../../common/bus", __dir__)
    config.autoload_paths << File.expand_path("../../../../common/facade", __dir__)

  end
end
