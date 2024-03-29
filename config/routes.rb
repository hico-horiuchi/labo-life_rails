Rails.application.routes.draw do
  root to: 'top#index'

  get 'login' => 'login#new', as: :new_login
  post 'login' => 'login#login'
  get 'login/destroy' => 'login#destroy', as: :destroy_login

  get 'users/home' => 'users#home', as: :home_user
  resources :users
  post 'users/:id/activate' => 'users#activate', as: :activate_user
  post 'users/:id/deactivate' => 'users#deactivate', as: :deactivate_user

  resources :seminors
  get 'seminors/:id/attend' => 'seminors#attend', as: :attend_seminor
  post 'seminors/:id/activate' => 'seminors#activate', as: :activate_seminor
  post 'seminors/:id/deactivate' => 'seminors#deactivate', as: :deactivate_seminor

  resources :event
  get 'event/:id/attend' => 'event#attend', as: :attend_event

  get 'attends/:seminor_id' => 'attends#new', as: :new_attend
  resources :attends
  post 'attends/:id/activate' => 'attends#activate', as: :activate_attend
  post 'attends/:id/deactivate' => 'attends#deactivate', as: :deactivate_attend

  get 'absent/:seminor_id' => 'absent#new', as: :new_absent
  resources :absent

  resources :reports

  get 'comments/:report_id' => 'comments#new', as: :new_comment
  resources :comments

  get 'minutes/:seminor_id' => 'minutes#new', as: :new_minutes

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
