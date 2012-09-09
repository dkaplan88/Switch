Switch::Application.routes.draw do
  resources :histories
  resources :devises
  root to: "devises#index"
  get "get_history", :controller => "devises", :action => "get_history", :as => "get_history"
  
end
