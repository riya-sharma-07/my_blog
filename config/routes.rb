Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :blogs, only: [:index, :show]
  root to: "blogs#index"
end
