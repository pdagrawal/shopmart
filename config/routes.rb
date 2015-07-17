Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => {:registrations => "my_devise/registrations"}
  namespace :admin do
    resources :categories, except:[:show, :edit, :update]
    resources :products
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
  get 'user/orders', to: 'orders#all_orders_of_a_user'
  get 'welcome/index'
  get 'about_us', to: 'welcome#about_us'
  get 'contact_us', to: 'welcome#contact_us'
  get '*other', to: redirect('')
  
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
