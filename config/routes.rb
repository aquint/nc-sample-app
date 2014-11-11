NarrowcontentApp::Application.routes.draw do
  get "interface/show"
  resources :task_lists

  get "teams/new"
  root 'users#new'
  get 'signup' => "users#new"
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :teams
    end
  end
  resources :teams do
     member do
      get :members
    end
  end
  resources :task_lists do
    resources :items do
      member do
        patch :complete
      end
    end
  end
  resources :memberships,       only: [:create, :destroy]
  resources :interface,       only: [:show] do
    member do
      post :join
    end
  end
  
end
