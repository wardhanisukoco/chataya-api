Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlRails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rooms do
    resources :messages
  end
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
