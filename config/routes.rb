Rails.application.routes.draw do
  root 'pages#home'
  resources :sessions
  get 'take_test/:submission_id', to: 'pages#take_test', as: 'take_test'
  get 'display_activity_log/:user_id', to: 'pages#display_activity_log', as: 'display_activity_log'
  post 'create_user', to: 'pages#create_user'
  post 'record_event', to: 'pages#record_event'
  post 'save_recording', to: 'pages#save_recording'


  mount ActionCable.server, at: '/cable'
end
