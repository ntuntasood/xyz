Rails.application.routes.draw do

  devise_for :users
  ActiveAdmin.routes(self)

  post 'creators/enable' => 'creators#enable'
  post 'creators/disable' => 'creators#disable'

  get 'dashboard' => 'dashboard#index'
  get 'dashboard/edit' => 'dashboard#edit'

  get 'search' => 'search#index'
  get 'login' => 'login#index'

  get 'contact' => 'contact#index'
  get 'privacy' => 'privacy#index'
  get 'terms' => 'terms#index'

  get '/:user' => 'users#show'

  root 'home#index'

end
