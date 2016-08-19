Rails.application.routes.draw do

  root to: 'entries#index'

  resources :entries

end
