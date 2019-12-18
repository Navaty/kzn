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
  
  get 'moder/' => 'wellcome#show'
    get'moder/discounts/' => 'discounts#moder'
    get'moder/posts/' => 'posts#moder'
    get'moder/places/' => 'places#moder'

resources :sliders
  #get 'slider/' => 'sliders#edit'

end
