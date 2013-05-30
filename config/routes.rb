VenShop::Application.routes.draw do


  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :category

  resources :products




  root :to=> 'static_pages#home'

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/products',    :to=> 'static_pages#products', via: 'get'
  match '/products/addtocart',    :to=> 'static_pages#products'


  match '/about',   :to=> 'static_pages#about'
  match '/contact', :to=> 'static_pages#contact'

  match '/search', :to=> 'static_pages#search'
  match '/item', :to=> 'static_pages#item'

  match '/category', :to=> 'static_pages#category'

  match '/getdata', to:'getproducts#index'

  match '/cart', :to=> 'static_pages#cart'

  match '/checkout_show', to: 'checkouts#show'
  match '/checkout_finish', to: 'checkouts#finish'







# resources :advertiser
#     match '/adv_management', to: 'adv_management#index'
#     match '/adv_management/info', to: 'adv_management#info'
#     match '/adv_management/edit', to: 'adv_management#edit'
#     match '/adv_management/review', to: 'adv_management#review'
#     match '/adv_management/update', to: 'adv_management#update'
#     match '/adv_management/list', to: 'adv_management#list'
#     match '/adv_management/detail/:id', to: 'adv_management#adv_detail'
#     match '/adv_management/user_apply', to: 'adv_management#adv_user_appl



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end


