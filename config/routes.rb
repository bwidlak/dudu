Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'public#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

    get 'signup', to: 'users#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

    get 'admin' => 'admin/base#index'
    namespace :admin do
      resources :categories
      resources :comments
      resources :images do
        get 'multi_change', on: :collection
      end
    end

    resources :sessions, only: [:new, :create, :destroy]
    resources :contacts
    resources :comments
    resources :categories do
      resources :images
    end

    get 'about' => 'public#about'

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




# ActionController::Routing::Routes.draw do |map|
#   map.admin '/admin', :controller => 'admin/base', :action => 'index'
#   map.namespace :admin do |admin|
#     admin.resources :categories
#     admin.resources :comments
#     admin.resources :images, :collection => {:multi_change => :get}
#   end

#   map.resources :sessions
#   map.resources :contacts
#   map.resources :comments
#   map.resources :categories, :has_many => :images

#   map.about     '/about',     :controller => 'public',    :action => 'about'
  
 
#   map.root :controller => "public"
  
  
# end
