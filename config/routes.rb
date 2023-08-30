Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "links#index"
  
  resources :links do
    resources :clicks do
    end
  end

  # get '*unmatched_route', to: redirect('/404.html'), format: false

  get '/:short_url' => 'links#show'

  get 'clicks_per_day_data', to: 'clicks#clicks_per_day_data'

end
