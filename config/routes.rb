# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  resources :books do
    post  :like,    on: :member
    put   :take,    on: :member
    put   :return,  on: :member

    resources :comments
  end
end
