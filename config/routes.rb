Readathon::Application.routes.draw do
  root "pages#index"
  
  resources :books, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
