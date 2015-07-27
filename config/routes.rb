Rails.application.routes.draw do
  
  root 'welcome#index'
  devise_for :users, :controllers => {:registrations => "registrations", :sessions => "sessions"}
  namespace :admin do
    resources :categories, except:[:show, :edit, :update]
    resources :products
    resources :activities
    resources :users, only:[:index, :show, :destroy]
    post 'add_admin_role/:id', to: 'roles#add_admin_role', as: 'add_admin_role'
    post 'remove_admin_role/:id', to: 'roles#remove_admin_role', as: 'remove_admin_role'
  end
  resources :categories, only:[:show]
  resources :products, only:[:show]
  post '/add_to_cart/:product_id' => 'carts#add_to_cart', as: 'add_to_cart'
  resources :carts, only:[:index, :show, :destroy]
  resources :line_items, except:[:create, :show]
  resources :orders, only:[:new, :show, :create]
  get 'user/:id/orders', to: 'users#all_orders_of_a_user', as: 'user_orders'
  get 'welcome/index'
  get 'about_us', to: 'welcome#about_us'
  get 'contact_us', to: 'welcome#contact_us'
  get '*other', to: redirect('')
  
end
