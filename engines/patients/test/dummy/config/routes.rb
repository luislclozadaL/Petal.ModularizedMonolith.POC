Rails.application.routes.draw do
  mount Patients::Engine => "/patients"
end
