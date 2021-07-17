# frozen_string_literal: true

Rails.application.routes.draw do
  root 'scrappers#index'
  post '/scrapper', to: 'scrappers#scrapp', as: 'scrapp'
  post '/add', to: 'scrappers#create', as: 'scrapp_add'
end
