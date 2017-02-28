Rails.application.routes.draw do
  resources :portfolios
  resources :blogs do
    member do
      get :toggle_status, to: 'blogs#toggle_status'
    end
  end

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  root to: 'pages#home'

  get '*path' => redirect('/')
end
