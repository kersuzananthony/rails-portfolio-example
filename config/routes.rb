Rails.application.routes.draw do
  # resources :comments
  devise_for :users, path: '', path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      sign_up: 'register'
  }
  resources :portfolios do
    put :sort, on: :collection
  end

  resources :topics, only: [:index, :show]

  resources :blogs do
    member do
      get :toggle_status, to: 'blogs#toggle_status'
    end
  end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  mount ActionCable.server => '/cable'

  root to: 'pages#home'

  get '*path' => redirect('/')
end
