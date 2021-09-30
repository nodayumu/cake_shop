Rails.application.routes.draw do

  root 'homes#top'
  get 'about' => 'homes#about'


  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registration'
  }

  devise_for :end_users, controllers: {
    sessions: 'end_users/sessions',
    passwords: 'end_users/passwords',
    registrations: 'end_users/registrations'
  }

  resources :end_users, only: [:show, :edit, :update, :destroy] do
    member do
      get :quit_confirm
    end
    patch "/hide" => "end_users#hide", as: 'hide'
  end

  resources :items, only: [:index, :show]

  namespace :admin do
    get '/', to: 'homes#top'
    resources :end_users, only: [:index]
    resources :items, except: [:destroy]
  end

end
