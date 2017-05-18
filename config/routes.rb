Rails.application.routes.draw do
  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, only: [:create]
  end
  get root to: 'cocktails#index'
  resources :doses, only: [:destroy]
end
