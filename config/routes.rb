require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app

  scope module: 'campaigns' do
    get 'ordered_campaigns'
  end

  root to: redirect('/ordered_campaigns.json', status: 302)
end
