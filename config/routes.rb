# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'attendances#new'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'

  get 'attendances/new', to: 'attendances#new'
  get 'attendances', to: 'attendances#index'

  post 'attendances/work_in', to: 'attendances_work_in#create'
  post 'attendances/break_in', to: 'attendances_break_in#create'
  post 'attendances/break_out', to: 'attendances_break_out#create'
  post 'attendances/work_out', to: 'attendances_work_out#create'

end
