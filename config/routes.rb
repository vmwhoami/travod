# frozen_string_literal: true

Rails.application.routes.draw do
  root 'scrappers#index'
  post '/scrapper', to: 'scrappers#scrapp', as: 'scrapp'
  post '/add', to: 'scrappers#create', as: 'scrapp_add'
  get '/*slug' => 'scrappers#all',
      param: :slug,
      as: 'scrapp_all',
      constraints: lambda { |req|
                     req.path.exclude? 'rails/active_storage'
                   }
end
