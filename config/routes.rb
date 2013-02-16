#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
Depot::Application.routes.draw do

  resources :comments


  get "upload/new" => "upload#get"
  post "upload/save"
  get "upload/picture"
  get "upload/show"

  get 'admin' => 'admin#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users

  resources :orders

  resources :line_items do
    member do
      put :decrement
    end
  end

  resources :carts

  get "search" => "store#search"

  get "store/index"

  resources :products do
    get :who_bought, on: :member
  end


  root to: 'store#index', as: 'store'
  # ...

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
