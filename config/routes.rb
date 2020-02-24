Rails.application.routes.draw do
  get 'entries/index'
  get 'entries/show'
  get 'entries/new'
  get 'entries/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "top#index"
  get "lesson/:action(/:name)" => "lesson"

  resources :users do
    collection { get "search" }
    resources :entries, only: [:index]
  end
  resources :entries
end
