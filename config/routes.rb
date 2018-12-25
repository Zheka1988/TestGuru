Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tests, only: :index do
    resources :questions,  only: :index do
      resources :answers,  only: :index
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests, shallow: true do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # get :exit, to: 'sessions#exit'

end
