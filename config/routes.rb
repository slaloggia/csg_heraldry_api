Rails.application.routes.draw do
  resources :heraldries do
    get :coat_of_arms, on: :member
  end
  resources :members 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
