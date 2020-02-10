Rails.application.routes.draw do
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'wellcome#index'
  resources :sales, only: [:show]
  resources :discounts, only: [:show, :index]
  resources :tidings, only: [:show]
  resources :posts, only: [:show, :index]
  resources :events, only: [:show]
  resources :places, only: [:show, :index]
  resources :maps, only: [:index]
  resources :pages, only: [:show]

  
  namespace :admin do
    resources :sales, except: [:show]
    resources :discounts, except: [:show, :index] do
      collection do
        get :moder
      end
    end
    resources :tidings, except: [:show]
    resources :posts, except: [:show, :index]do
      collection do
        get :moder
      end
    end
    resources :events, except: [:show]
    resources :places, except: [:show, :index]do
      collection do
        get :moder
      end
    end


    resources :sliders
    resources :users
    resources :pages, except: [:show]
  end

  get 'daddresses/' => 'maps#tabdiscounts'
  #get 'moder/' => 'wellcome#show'
   # get'moder/discounts/' => 'discounts#moder'
   # get'moder/posts/' => 'posts#moder'
    #get'moder/places/' => 'places#moder'


  #get 'slider/' => 'sliders#edit'

end
