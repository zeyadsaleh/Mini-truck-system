Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/api/v1/truck/:id/summary' => 'trucks#truck_distance'
  get '/api/v1/trucks/active' => 'trucks#active_trucks'
  post '/api/v1/truck/log' => 'truck_logs#create'

end
