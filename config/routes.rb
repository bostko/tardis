Rails.application.routes.draw do
  get '/money_transaction/:id' => 'money_transaction#index'
  root 'charity_campaign#index', as: :charity_campaigns

  get 'happy-story' => 'charity_campaign#happy'
  get 'category/:id' => 'category#show'

  get '/:id' => 'charity_campaign#show', as: :charity_campaign

  post '/' => 'charity_campaign#create', as: :create_charity_campaign
  get '/charity_campaign/new' => 'charity_campaign#new', as: :new_charity_campaign

  get '/money_transactions' => 'money_transaction#list', as: :money_transactions
  post '/money_transactions' => 'money_transaction#create', as: :create_money_transactions

  # post '/charity_campaign/create' => 'charity_campaign#create', as: :create_charity_campaign

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
