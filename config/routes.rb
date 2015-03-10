Rails.application.routes.draw do
  resources :users, only: [:index, :create, :update, :destroy, :show] do
    resources :contacts, only: :index do
      member do
        get 'favorite'
      end
    end
    resources :groups, only: :index
  end

  resources :contacts, only: [:create, :update, :destroy, :show]

  resources :contact_shares, only: [:create, :destroy]

  resources :groups, only: [:show]

end
