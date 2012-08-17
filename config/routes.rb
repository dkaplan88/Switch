Switch::Application.routes.draw do
  resources :histories
  resources :devises
  root to: "devises#index"
end
