Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top#index"
  get "lesson/:action(/:name)" => "lesson"

  resources :members
end
