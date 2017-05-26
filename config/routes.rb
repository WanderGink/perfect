Rails.application.routes.draw do
  devise_for :users
  get "pages/*page" => "pages#show"
  get "pages/help"
  get "pages/about"
  get "pages/contact"
  root "pages#show", page: "home"

  resources :products
end
