Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sales
  resources :discounts
  resources :tidings
  resources :posts
  
  get 'moder/' => 'discounts#moder'

end
