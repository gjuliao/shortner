Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "links#index"
  
  resources :links do
    resources :clicks do
    end
  end

  get '/:short_url' => 'links#show'

end
