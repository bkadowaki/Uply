Rails.application.routes.draw do

  devise_for :companies
  devise_for :users

  root 'static_pages#index'
  get '/logo', to: 'static_pages#logo'
  get '/websites/d3', to: 'websites#d3'
  get '/categories/front', to: 'categories#front'
  # post '/websites/:website_id/comments/', to: 'comments#create', as: 'website_comments'
  # post '/websites/:website_id/comments/:id/ups', to: 'comments#up', as: 'up_website_comment'
  # post '/websites/:id/up', to: 'websites#up', as: 'up_website'
  
  resources :categories, :users, :companies
  
  namespace 'api', defaults: { format: 'json' } do
    get '/websites/comscore', to: 'websites#comscore', defaults: { format: 'json.jbuilder' }
    resources :websites
  end
  
  namespace 'api', defaults: { format: 'json.jbuilder' }  do
    resources :categories
  end
    
  namespace 'api', defaults: { format: 'json.jbuilder' }  do
    get 'comments/top', to: 'comments#top'
  end

  resources :websites do
    resources :comments, only: [:create] do
      member do
        post :up
      end
    end
    member do
      post :up
    end
  end
  
  # get '*path', to: 'static_pages#index'

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
