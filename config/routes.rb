# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Api::Engine => 'docs' # /docs/v1/swagger.yml
  mount Rswag::Ui::Engine => 'docs'

  resources :authors
  resources :courses
  resources :skills

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
