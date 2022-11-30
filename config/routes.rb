# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get '/', to: 'home#index'
  get '/citizens', to: 'citizens#index'
  get '/cities', to: 'cities#index'
end
