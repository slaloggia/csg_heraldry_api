Rails.application.routes.draw do

  resources :heraldries do
    get :coat_of_arms, on: :member
  end
  resources :members 
  resources :auth, only: [:create]
end
