Rails.application.routes.draw do
  root to: "cocktails#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 resources :cocktails, only: [:index, :show, :new, :create] do
  resources :doses, only: [:create]
 end

end
