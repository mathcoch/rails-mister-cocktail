Rails.application.routes.draw do
  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, only: [:create]
  end

  resources :doses, only: [:destroy]
end
