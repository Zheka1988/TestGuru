Rails.application.routes.draw do


  namespace :admin do
    get 'gists/index'
    delete 'gists/destroy'
  end

  get 'feedbacks/new'
  get 'feedbacks/create'

  root to: 'tests#index'


  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
              :controllers => { sessions: 'sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index

  resources :tests, only: :index do
    resources :questions,  only: :index do
      resources :answers,  only: :index
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests, shallow: true do
      patch :update_inline, on: :member
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
   resources :gists, only: :index
   resources :badges
  end

end
