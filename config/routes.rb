Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'wellcome#index'
  resources :sales
  resources :discounts
  resources :tidings
  resources :posts
  resources :events
  resources :places
  
  get 'moder/' => 'discounts#moder'

end
