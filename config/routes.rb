Rails.application.routes.draw do

  root to: 'entries#index'

  resources :entries

  resources :users,
    only: [:new, :create],
    path_names: { new: 'signup' }

  get 'login' => 'sessions#login'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'about' => 'descriptions#about'

end
