Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [:index, :new, :create, :show]
  end

  resources :restaurants do
    resources :reviews, only: [:new]
end
