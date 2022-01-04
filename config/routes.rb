Rails.application.routes.draw do
  get 'sessions/new'
  get '/signup' ,to: 'users#new'
  post '/users',to: 'users#create'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/signout',  to: 'sessions#destroy'
  get 'attendances/new',to: 'attendances#new'
  get 'attendances', to:'attendances#index'
  post 'attendances/work_in', to:'attendances#register_work_in'
  post 'attendances/break_in', to:'attendances#register_break_in'
  post 'attendances/break_out', to:'attendances#register_break_out'
  post 'attendances/work_out', to:'attendances#register_work_out'

end
