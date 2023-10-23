Rails.application.routes.draw do
  # get 'products/index'
  resources :products, only: %i[index show]
end
