Readathon::Application.routes.draw do
  root "pages#index"
  
  resources :books
end
