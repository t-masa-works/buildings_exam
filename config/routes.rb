Rails.application.routes.draw do
  resources :buildings do
    resources :stations
  end
end
