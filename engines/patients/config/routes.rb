Patients::Engine.routes.draw do
    resources :patients, only: [:index, :create, :show]
end
