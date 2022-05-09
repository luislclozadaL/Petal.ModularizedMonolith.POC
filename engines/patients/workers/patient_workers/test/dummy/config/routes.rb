Rails.application.routes.draw do
  mount PatientWorkers::Engine => "/patient_workers"
end
