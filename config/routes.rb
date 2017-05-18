Rails.application.routes.draw do
  get 'cocktails/search', to: 'cocktails#search', as: 'cocktails_search'
  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, only: [:create]
  end
  resources :doses, only: [:destroy]
  get root to: 'cocktails#index'
end
