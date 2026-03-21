# frozen_string_literal: true

Rails.application.routes.draw do
  get 'special_pages/home'
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/tutorials/:tutorial/:chapter', to: 'tutorials#show', as: :chapter

  root to: 'special_pages#home'
end
