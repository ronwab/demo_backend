# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :people

  get '/frequency_checker', to: 'people#frequency_checker'
  # '

  root 'people#home'
end
