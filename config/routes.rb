# frozen_string_literal: true

Rails.application.routes.draw do
  root 'scrappers#index'
  post '/scrapper', to: 'scrappers#scrapp', as: 'scrapp'
end
