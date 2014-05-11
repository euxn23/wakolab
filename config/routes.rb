Wakolab::Application.routes.draw do
  resources :animations
  resources :tops
  resources :reservations
  resources :profiles

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  get '/' => 'tops#index'
  get '/me/' => 'tops#aboutme'

  get '/admin' => 'tops#admin'

  get '/ds/' => 'tops#ds'
  get '/ds/coil' => 'tops#ds_coil'

  get '/rs/' => 'reservations#index'
  get '/rs/new' => 'reservations#new'
  get '/rs/(:id)' => 'reservations#show'
  get '/rs/edit' => 'reservations#edit'

  get '/an/' => 'animations#index'
  get '/an/new' => 'animations#new'
  get '/an/(:id)' => 'animations#show'
  get '/an/edit' => 'animations#edit'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
