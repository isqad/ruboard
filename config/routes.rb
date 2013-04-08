Ruboard::Engine.routes.draw do
  root :to => 'forums#index'

  resources :forums, :only => [ :index, :show ] do
    resources :topics, :only => [ :show ]
  end
end
