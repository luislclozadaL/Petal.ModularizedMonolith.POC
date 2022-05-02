require 'boot_inquirer'

Rails.application.routes.draw do
  mount Patients::Engine => "/pat"

  # BootInquirer.each_active_app do |app|
  #   mount app.engine => '/', as: app.gem_name
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
