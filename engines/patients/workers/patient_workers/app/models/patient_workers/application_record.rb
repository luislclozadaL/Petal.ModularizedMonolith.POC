module PatientWorkers
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
