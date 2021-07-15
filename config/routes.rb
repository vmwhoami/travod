# frozen_string_literal: true

Rails.application.routes.draw do
  root 'scrapper#index'
  post '/scrapper', to: 'scrapper#scrapp', as: 'scrapp'
end
