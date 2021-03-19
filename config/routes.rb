Rails.application.routes.draw do
  get 'hello/index'
  resources :import_books, only: %i[create]
  root 'home#index'
end
