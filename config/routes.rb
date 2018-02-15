Rails.application.routes.draw do
  get 'users/login_form' => 'users#login_form'
  post 'users/login'=> 'users#login'
  get 'users/sign_up' => 'users#sign_up'
  post 'users/create' => 'users#create'
  post 'users/logout' => 'users#logout'
  get 'users/:id/setting_profile' => 'users#setting_profile'
  post 'users/:id/update_profile' => 'users#update_profile'
  get 'users/:id/setting_account' => 'users#setting_account'
  post 'users/:id/update_account' => 'users#update_account'
  
  get 'notes/:id/top' => 'notes#top'
  get 'notes/new' => 'notes#new'
  post 'notes/create' => 'notes#create'
  get 'notes/:id/editor' => 'notes#editor'
  post 'notes/:id/update' => 'notes#update'
  get 'notes/:id/destroy_confirm' => 'notes#destroy_confirm'
  post 'notes/:id/destroy' => 'notes#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
end
