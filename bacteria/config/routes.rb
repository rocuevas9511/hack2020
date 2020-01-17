Rails.application.routes.draw do
  get 'insights/get'
  get 'insights/users'
  get 'insights/devices'
  resources :events
  resources :devices
  resources :users
  # resources :devices do
  #   collection do
  #     get :bla
  #   end
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
