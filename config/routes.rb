Rails.application.routes.draw do
  resources :types_reports
  resources :reports
  resources :users
  resources :signin

get '/reports/reportsbycoordinate/:latitude/:longitude/:ratio', to: 'reports#reportsByCoordinate'
get '/reports/myreports', to: 'reports#reportsUser'
get '/reports/reportsbytypereport/:type', to: 'reports#reportsByTypeReport'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
