Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  get 'users/new'
  get 'sessions/new'
  get 'sessions/exit'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  get :signup, to: 'users#new'
  resources :users, only: :create

  get :login, to: 'sessions#new'
  get :exit, to: 'sessions#exit'

  resources :sessions, only: [:create, :exit]
end
