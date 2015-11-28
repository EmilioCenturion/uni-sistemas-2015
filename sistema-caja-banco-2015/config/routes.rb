
Rails.application.routes.draw do
  get 'auditoria_logs/buscar'

  get 'welcome/index'

  resources :configuracions
  
  resources :usuarios
  
  resources :proveedors

  resources :clientes

  devise_for :users

  resources :movimiento_bancos

  resources :cupon_emitidos

  resources :cheque_recibidos

  resources :cheque_emitidos

  resources :apertura_cajas do
    resources :movimiento_cajas
    resources :boleta_depositos
  end

  resources :cajas 

  resources :motivo_movimiento_cajas

  resources :motivo_movimiento_bancos

  resources :cuenta do
    resources :chequeras
    resources :credits
  end

  resources :personals

  resources :ciudads

  resources :pais

  resources :bancos

  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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

