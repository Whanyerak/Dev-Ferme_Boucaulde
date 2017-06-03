Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :admin_users, { class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'meta#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  post '/' => 'meta#update'
end
